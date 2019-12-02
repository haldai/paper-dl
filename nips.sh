#!/usr/bin/env bash

source util.sh

# 如果没有输入参数
if [ ${#@} == 0 ]; then
    echo -e "${red}please input the year!${nc}" && exit 1
fi

# 获取脚本目录
script_dir=$(dirname $0)

# 创建保存html文件的目录
create d "$script_dir/html"

# 下载nips根目录
d_curl "http://papers.nips.cc/" "$script_dir/html/nips.html"

year_url=$(cat "$script_dir/html/nips.html" | sed -n "s/.*href=\"\(.*\)\".*NIPS $1.*/\1/p")
folder=$(cat "$script_dir/html/nips.html" | sed -n "s/.*\".\(.*NIPS $1.*\).\/a.*/\1/p")
# delete -f "$script_dir/html/nips.html"
if [ -z "$year_url" ]; then
    echo -e "${red}Error: illegal input year!${nc}" && exit 1
fi

# 下载指定的卷目录
d_curl "http://papers.nips.cc$year_url" "$script_dir/html/nips-$1.html"

# 读取文章列表
i=0 && j=0
while read -r line; do
    if [[ "$line" =~ "<li><a href=\"/paper/" ]]; then
        if [ ${#@} == 1 ]; then # 如果只有卷号 直接保存进数组
            url_array[$i]=$(echo $line | cut -d '>' -f 2 | sed -n "s/.*href=\"\(.*\)\".*/\1/p")
            title_array[$i]=$(echo $line | cut -d '>' -f 3 | sed -n "s/\(.*\).\/a.*/\1/p")
            ((i++))
        else # 如果还有关键词
            keywords_find=1
            for arg in $@; do
                arg=${arg,,}
                if [ "$arg" != "$1" ] && [[ ! "$line" =~ "$arg" ]] && [[ ! "$line" =~ "${arg^}" ]] && [[ ! "$line" =~ "${arg,}" ]] && [[ ! "$line" =~ "${arg^^}" ]]; then # 如果有一个关键词没找到
                    keywords_find=0
                fi
            done
            if [ "$keywords_find" == 1 ]; then # 如果包含了全部关键词
                url_array[$i]=$(echo $line | cut -d '>' -f 2 | sed -n "s/.*href=\"\(.*\)\".*/\1/p")
                title_array[$i]=$(echo $line | cut -d '>' -f 3 | sed -n "s/\(.*\).\/a.*/\1/p")
                ((i++))
            fi
        fi
    fi
done <"$script_dir/html/nips-$1.html"

len=$i # 总查询结果数目

if [ "$i" -gt 0 ]; then
    while [ "$i" -gt 0 ]; do
        echo -e "${purple}$i${nc} ${title_array[$(($i - 1))]}" && ((i--)) && select_array[$i]=0 # 倒序输出查询结果
    done
    echo -e "${yellow}==> Papers to download (eg: 1 2 3, 1-3 or ^4), default all ($len)${nc}"
    read -p $'\033[33m==> \033[0m' input
else
    echo -e "${red}Warning: no papers meet the query conditions!${nc}" && exit 1
fi

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

            d_curl "http://papers.nips.cc${url_array[$i]}" "$script_dir/html/paper.html" s

            pdf_url=$(cat "$script_dir/html/paper.html" | sed -n "s/.*href=\"\(.*\)\".*PDF.*/\1/p")
            pdf_url_array=(${pdf_url//\// })
            pdf_name=${pdf_url_array[-1]}
            if [ -f "$script_dir/$folder/$title/$pdf_name" ]; then
                echo -e "${yellow}Paper already exists!${nc}"
            else
                echo -e "${yellow}Download paper: ${nc}"
                d_curl "http://papers.nips.cc$pdf_url" "$script_dir/$folder/$title/$pdf_name" ns
            fi

            bib_url=$(cat "$script_dir/html/paper.html" | sed -n "s/.*href=\"\(.*\)\".*BibTeX.*/\1/p")
            if [ -f "$script_dir/$folder/$title/$pdf_name.bib" ]; then
                echo -e "${yellow}Bib already exists!${nc}"
            else
                echo -e "${yellow}Download bib: ${nc}"
                d_curl "http://papers.nips.cc$bib_url" "$script_dir/$folder/$title/$pdf_name.bib" ns
            fi

            supplemental_url=$(cat "$script_dir/html/paper.html" | sed -n "s/.*href=\"\(.*\)\".*Supplemental.*/\1/p")
            if [ -f "$script_dir/$folder/$title/$pdf_name.zip" ]; then
                echo -e "${yellow}Supplemental already exists!${nc}"
            else
                echo -e "${yellow}Download Supplemental: ${nc}"
                d_curl "http://papers.nips.cc$supplemental_url" "$script_dir/$folder/$title/$pdf_name.zip" ns
            fi

            review_url=$(cat "$script_dir/html/paper.html" | sed -n "s/.*href=\"\/\/\(.*\)\".*Reviews.*/\1/p")
            if [ -f "$script_dir/$folder/$title/review.html" ]; then
                echo -e "${yellow}Reviews already exists!${nc}"
            else
                echo -e "${yellow}Download reviews: ${nc}"
                d_curl "$review_url" "$script_dir/$folder/$title/review.html" ns
            fi
        fi
        ((i++))
    done
else
    echo -e "${red}Warning: there is no papers to download!${nc}"
fi
