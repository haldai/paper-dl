#!/usr/bin/env bash

source util.sh

# 如果没有输入参数
if [ $# == 0 ]; then
    echo -e "${red}Error: please input the volume number!${nc}" && exit 1
fi

# 获取脚本目录
script_dir=$(dirname $0)

# 创建保存html文件的目录
create d "$script_dir/html"

# 下载pmlr根目录
d_curl "http://proceedings.mlr.press/" "$script_dir/html/pmlr.html" s

folder=$(cat "$script_dir/html/pmlr.html" | sed -n "s/.*$1.*\/a. \(.*\)/\1/p")
volume=$(cat "$script_dir/html/pmlr.html" | sed -n "s/.*href=\"\(.*\)\".*$1.*/\1/p")
delete f "$script_dir/html/pmlr.html"
if [ -z "$folder" ]; then
    echo -e "${red}Error: illegal volume number!${nc}" && exit 1
fi

# 下载指定的卷目录
d_curl "http://proceedings.mlr.press/$volume/" "$script_dir/html/pmlr-$volume.html" s

# 读取文章列表
i=0 && j=0 && url_line=0
while read -r line; do
    if [[ "$line" =~ "\"title\"" ]]; then
        if [ $# == 1 ]; then # 如果只有卷号 直接保存进数组
            title_array[$i]=$(echo $line | sed -n "s/.*title\".\(.*\).\/p.*/\1/p") && ((i++))
        else # 如果还有关键词
            keywords_find=1
            for arg in $@; do
                arg=${arg,,}
                if [ "$arg" != "$1" ] && [[ ! "$line" =~ "$arg" ]] && [[ ! "$line" =~ "${arg^}" ]] && [[ ! "$line" =~ "${arg,}" ]] && [[ ! "$line" =~ "${arg^^}" ]]; then # 如果有一个关键词没找到
                    keywords_find=0
                fi
            done
            if [ "$keywords_find" == 1 ]; then # 如果包含了全部关键词
                title_array[$i]=$(echo $line | sed -n "s/.*title\".\(.*\).\/p.*/\1/p") && url_line=1 && ((i++))
            fi
        fi
    fi
    if [[ "$line" =~ "Download PDF" ]]; then
        if [ $# == 1 ]; then # 如果只有卷号 直接保存进数组
            url_array[$j]="$line" && ((j++))
        else # 如果还有关键词
            if [ "$url_line" == 1 ]; then
                url_array[$j]="$line" && url_line=0 && ((j++))
            fi
        fi
    fi
done <"$script_dir/html/pmlr-$volume.html"

if [ "$i" -gt 0 ]; then
    while [ "$i" -gt 0 ]; do
        echo -e "${purple}$i${nc} ${title_array[$(($i - 1))]}" && ((i--)) && select_array[$i]=0 # 倒序输出查询结果
    done
    echo -e "${yellow}==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all ($j)${nc}"
    read -p $'\033[33m==> \033[0m' input
else
    echo -e "${red}Warning: no papers meet the query conditions!${nc}" && exit 1
fi

len=${#select_array[@]} # 总查询结果数目

# 处理输入
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
            if [ "$value" -le "$len" ]; then
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
            if [ "$value" -le "$len" ]; then
                select_array[$(($value - 1))]=0
            fi
        fi
    done
fi

# 检查是否有下载任务
total=0
for value in ${select_array[@]}; do
    if [ "$value" == 1 ]; then
        ((total++))
    fi
done

if [ "$total" -gt 0 ]; then
    create d "$script_dir/$folder"

    i=0 && j=0
    while [ "$i" -lt "$len" ]; do
        if [ "${select_array[$i]}" == "1" ]; then
            title=${title_array[$i]}
            create d "$script_dir/$folder/$title"

            ((j++))
            awk 'BEGIN{printf "\033[35m\n%d/%d (%.2f%)\033[0m", '$j', '$total', (100 * '$j'/'$total')}'
            echo -e " $title"

            pdf_url=$(echo ${url_array[$i]} | sed -n "s/.*href=\"\(.*[1-9][1-9][a-z].pdf\)\" target.*/\1/p")
            pdf_url_array=(${pdf_url//\// })
            pdf_name=${pdf_url_array[-1]}
            if [ -f "$script_dir/$folder/$title/$pdf_name" ]; then
                echo -e "${yellow}Paper already exists!${nc}"
            else
                echo -e "${yellow}Download paper: ${nc}"
                d_curl "$pdf_url" "$script_dir/$folder/$title/$pdf_name" ns
            fi

            if [[ "${url_array[$i]}" =~ "Supplementary PDF" ]]; then
                supp_url=$(echo "${url_array[$i]}" | sed -n "s/.*Download PDF.*href=\"\(.*-supp.pdf\)\" target.*/\1/p")
                supp_url_array=(${supp_url//\// })
                supp_name=${supp_url_array[-1]}
                if [ -f "$script_dir/$folder/$title/$supp_name" ]; then
                    echo -e "${yellow}Supplementary already exists!${nc}"
                else
                    echo -e "${yellow}Download supplementary: ${nc}"
                    d_curl "$supp_url" "$script_dir/$folder/$title/$supp_name" ns
                fi

                # 合并
                pdftk "$script_dir/$folder/$title/$pdf_name" "$script_dir/$folder/$title/$supp_name" cat output "$script_dir/$folder/$title/${pdf_name:0:-4}-merge.pdf"
            fi
        fi
        ((i++))
    done
else
    echo -e "${red}Warning: there is no papers to download!${nc}"
fi
