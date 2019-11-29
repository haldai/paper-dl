#!/usr/bin/env bash

#SAVEIFS=$IFS
#IFS=$(echo -en "\n\b")

source util.sh

# 如果没有输入参数
if [ ${#@} == 0 ]; then
    echo -e "${red}Error: please input the volume number!${nc}" && exit 1
fi

# 获取脚本目录
script_dir=$(dirname $0)

# 创建保存html文件的目录
create d "$script_dir/html"

# 下载JMLR根目录
d_curl "http://proceedings.mlr.press/" "$script_dir/html/jmlr.html"

folder=$(cat "$script_dir/html/jmlr.html" | sed -n "s/.*$1.*\/a. \(.*\)/\1/p")
volume=$(cat "$script_dir/html/jmlr.html" | sed -n "s/.*href=\"\(.*\)\".*$1.*/\1/p")
# delete f "$script_dir/html/jmlr.html"
if [ -z "$folder" ]; then
    echo -e "${red}Error: illegal volume number!${nc}" && exit 1
fi

# 下载指定的卷目录
d_curl "http://proceedings.mlr.press/$volume/" "$script_dir/html/jmlr-$volume.html"

i=0 && j=0 && url_line=0
while read -r line; do
    if [[ "$line" =~ "\"title\"" ]]; then
        if [ ${#@} == 1 ]; then # 如果只有卷号 直接保存进数组
            title_array[$i]="$(echo $line | cut -d '>' -f 2 | cut -d '<' -f 1)" && ((i++))
        else # 如果还有关键词
            keywords_find=1
            for arg in $@; do # 查看是否包含全部关键词
                arg=${arg,,}
                if [ "$arg" != "$1" ] && [[ ! "$line" =~ "$arg" ]] && [[ ! "$line" =~ "${arg^}" ]] && [[ ! "$line" =~ "${arg,}" ]] && [[ ! "$line" =~ "${arg^^}" ]]; then
                    keywords_find=0
                fi
            done
            if [ "$keywords_find" == 1 ]; then
                title_array[$i]="$(echo $line | cut -d '>' -f 2 | cut -d '<' -f 1)" && ((i++)) && url_line=1
            fi
        fi
    fi
    if [[ "$line" =~ "Download PDF" ]]; then
        if [ ${#@} == 1 ]; then # 如果只有卷号 直接保存进数组
            url_array[$j]="$line" && ((j++))
        else # 如果还有关键词
            if [ "$url_line" == 1 ]; then
                url_array[$j]="$line" && ((j++)) && url_line=0
            fi
        fi
    fi
done <"$script_dir/html/jmlr-$volume.html"

# rm "$script_dir/html/jmlr-$volume.html"

if [ "$i" -gt 0 ]; then
    while [ "$i" -gt 0 ]; do
        echo -e "${purple}$i${nc} ${title_array[$(($i - 1))]}" && ((i--)) && select_array[$i]=0
    done
    echo -e "${yellow}==> papers to download (eg: 1 2 3, 1-3 or ^4), default all ($j)${nc}"
    read -p $'\033[33m==> \033[0m' input
else
    echo -e "${red}no papers meet the query conditions!${nc}" && exit 1
fi

len=${#select_array[@]}

if [ -z "${input// /}" ]; then
    for i in "${!select_array[@]}"; do
        select_array[i]=1
    done
else
    input=($input)
    for value in ${input[@]}; do
        if [ "$(echo "$value" | awk '{print($0~/^[1-9][0-9]*-[1-9][0-9]*$/)}')" == 1 ]; then
            i=$(echo "$value" | cut -d '-' -f 1) && j=$(echo "$value" | cut -d '-' -f 2)
            while [ "$i" -le "$j" ] && [ "$i" -le "$len" ]; do
                select_array[$(($i - 1))]=1 && ((i++))
            done
        elif [ "$(echo "$value" | awk '{print($0~/^[1-9][0-9]*$/)}')" == 1 ]; then
            if [ "$value" -lt "$len" ]; then
                select_array[$(($value - 1))]=1
            fi
        fi
    done

    for value in ${input[@]}; do
        if [ "$(echo "$value" | awk '{print($0~/^[\^][0-9]*-[1-9][0-9]*$/)}')" == 1 ]; then
            value=${value:1}
            i=$(echo "$value" | cut -d '-' -f 1) && j=$(echo "$value" | cut -d '-' -f 2)
            k=0
            while [ "$k" -lt "$len" ]; do
                if [ "$k" -lt "$i" ] || [ "$k" -ge "$j" ]; then
                    select_array[$k]=1
                fi
                ((k++))
            done
        elif [ "$(echo "$value" | awk '{print($0~/^[\^][1-9][0-9]*$/)}')" == 1 ]; then
            value=${value:1}
            k=0
            while [ "$k" -lt "$len" ]; do
                if [ "$k" != "$(($value - 1))" ]; then
                    select_array[$k]=1
                fi
                ((k++))
            done
        fi
    done

    for value in ${input[@]}; do
        if [ "$(echo "$value" | awk '{print($0~/^[\^][0-9]*-[1-9][0-9]*$/)}')" == 1 ]; then
            value=${value:1}
            i=$(echo "$value" | cut -d '-' -f 1)
            j=$(echo "$value" | cut -d '-' -f 2)
            while [ "$i" -le "$j" ] && [ "$i" -le "$len" ]; do
                select_array[$(($i - 1))]=0 && ((i++))
            done
        elif [ "$(echo "$value" | awk '{print($0~/^[\^][1-9][0-9]*$/)}')" == 1 ]; then
            value=${value:1}
            if [ "$value" -lt "$len" ]; then
                select_array[$(($value - 1))]=0
            fi
        fi
    done
fi

flag=0 && total=0
for value in ${select_array[@]}; do
    if [ "$value" == 1 ]; then
        flag=1 && ((total++))
    fi
done

if [ "$flag" == 1 ]; then
    if [ ! -d "$script_dir/$folder" ]; then
        mkdir "$script_dir/$folder"
    fi

    i=0 && j=0
    while [ "$i" -lt "$len" ]; do
        if [ "${select_array[$i]}" == "1" ]; then
            title=${title_array[$i]}
            create d "$script_dir/$folder/$title"

            ((j++))
            awk 'BEGIN{printf "\033[35m\n%d/%d (%.2f%)\033[0m", '$j', '$total', (100 * '$j'/'$total')}'
            echo -e " $title"

            echo -e "${yellow}Download paper: ${nc}"
            pdf_url=$(echo ${url_array[$i]} | sed "s/.*href=\"\(.*[1-9][1-9][a-z].pdf\)\" target.*/\1/g")
            pdf_name=$(echo $pdf_url | cut -d "/" -f 6)
            d_curl "$pdf_url" "$script_dir/$folder/$title/$pdf_name" ns

            if [[ "${url_array[$i]}" =~ "Supplementary PDF" ]]; then
                echo -e "${yellow}Download supplementary: ${nc}"
                pdf_url=$(echo "${url_array[$i]}" | sed "s/.*Download PDF.*href=\"\(.*-supp.pdf\)\" target.*/\1/g")
                pdf_name=$(echo $pdf_url | cut -d "/" -f 6)
                d_curl "$pdf_url" "$script_dir/$folder/$title/$pdf_name" ns
            fi
        fi
        ((i++))
    done
else
    echo -e "${red}There is no papers to download!${nc}"
fi
