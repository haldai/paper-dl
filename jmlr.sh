#!/usr/bin/env bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ ${#@} == 0 ]; then
    echo "please input the volume number!"
    exit
fi

script_dir=$(dirname $0)
if [ ! -d "$script_dir/temporary files" ]; then
    mkdir "$script_dir/temporary files"
fi

jmlr_root=http://proceedings.mlr.press/
while [ ! -f "$script_dir/temporary files/jmlr root.html" ]; do
    if [ $(curl -o /dev/null -sIL -w %{http_code} $jmlr_root) == 200 ]; then
        curl -s "$jmlr_root" -o "$script_dir/temporary files/jmlr root.html"
    else
        echo "can't download $jmlr_root!"
        exit
    fi
done

folder=$(cat "$script_dir/temporary files/jmlr root.html" | grep "Volume $1" | sed "s/.*\/a. \(.*\).*/\1/g")
volume=$(cat "$script_dir/temporary files/jmlr root.html" | grep "Volume $1" | sed "s/.*href=\"\(.*\)\".*/\1/g")
rm "$script_dir/temporary files/jmlr root.html"
if [ -z "$folder" ]; then
    echo "illegal volume number, exit!"
    exit
fi

host=http://proceedings.mlr.press/$volume/
while [ ! -f "$script_dir/temporary files/jmlr $volume.html" ]; do
    if [ $(curl -o /dev/null -sIL -w %{http_code} $host) == 200 ]; then
        curl -s "$host" -o "$script_dir/temporary files/jmlr $volume.html"
    else
        echo -e "can't download $host!"
        exit
    fi
done

if [ -f "$script_dir/select" ]; then
    rm "$script_dir/select"
else
    touch "$script_dir/select"
fi

if [ ${#@} == 1 ]; then
    total=$(cat "$script_dir/jmlr $volume.html" | grep \"title\" | wc -l)
    while read -r line; do
        if [[ "$line" =~ "\"title\"" ]]; then
            title=$(echo $line | cut -d '>' -f 2 | cut -d '<' -f 1)
            echo "title: $title" >>"$script_dir/select"
        fi
        if [[ "$line" =~ "Download PDF" ]]; then
            echo "url: $line" >>"$script_dir/select"
        fi
    done <"$script_dir/temporary files/jmlr $volume.html"
else
    total=0
    url_line=0
    while read -r line; do
        if [ "$url_line" == 0 ]; then
            if [[ "$line" =~ "\"title\"" ]]; then
                keywords_find=1
                for arg in $@; do
                    arg=${arg,,}
                    if [ "$arg" != "$1" ] && [[ ! "$line" =~ "$arg" ]] && [[ ! "$line" =~ "${arg^}" ]] && [[ ! "$line" =~ "${arg,}" ]] && [[ ! "$line" =~ "${arg^^}" ]]; then
                        keywords_find=0
                    fi
                done
                if [ "$keywords_find" == 1 ]; then
                    ((total++))
                    url_line=1
                    title=$(echo $line | cut -d '>' -f 2 | cut -d '<' -f 1)
                    echo "title: $title" >>"$script_dir/select"
                fi
            fi
        else
            if [[ "$line" =~ "Download PDF" ]]; then
                echo "url: $line" >>"$script_dir/select"
                url_line=0
            fi
        fi
    done <"$script_dir/temporary files/jmlr $volume.html"
fi
# rm "$script_dir/temporary files/jmlr $volume.html"

if [ $total -gt 0 ]; then
    num=0
    while read -r line; do
        if [[ "$line" =~ "title: " ]]; then
            ((num++))
            echo $num. ${line//"title: "/}
        fi
    done <"$script_dir/select"
    echo ""
    read -p "find $total paper(s), download them all (Y/n): " start
else
    echo -e "no papers meet the query conditions!"
    rm "$script_dir/select"
    exit
fi

if [ "$start" != 'n' ]; then
    if [ ! -d "$script_dir/$folder" ]; then
        mkdir "$script_dir/$folder"
    fi

    num=0
    while read -r line; do
        if [[ "$line" =~ "title" ]]; then
            title=${line//"title: "/}
            if [ ! -d "$script_dir/$folder/$title" ]; then
                mkdir "$script_dir/$folder/$title"
            fi
            ((num++))
            echo ""
            awk 'BEGIN{printf "%d/%d (%.2f%)", '$num', '$total', (100 * '$num'/'$total')}'
            echo " $title"
        else
            pdf_url=$(echo $line | sed "s/.*href=\"\(.*[1-9][1-9][a-z].pdf\)\" target.*/\1/g")
            pdf_name=$(echo $pdf_url | cut -d "/" -f 6)
            while [ ! -f "$script_dir/$folder/$title/$pdf_name" ]; do
                if [ $(curl -o /dev/null -sIL -w %{http_code} "$pdf_url") == 200 ]; then
                    curl "$pdf_url" -o "$script_dir/$folder/$title/$pdf_name"
                else
                    echo -e "can't download paper!"
                    continue
                fi
            done

            if [[ "$line" =~ "Supplementary PDF" ]]; then
                pdf_url=$(echo $line | sed "s/.*Download PDF.*href=\"\(.*-supp.pdf\)\" target.*/\1/g")
                pdf_name=$(echo $pdf_url | cut -d "/" -f 6)
                while [ ! -f "$script_dir/$folder/$title/$pdf_name" ]; do
                    if [ $(curl -o /dev/null -sIL -w %{http_code} "$pdf_url") == 200 ]; then
                        curl "$pdf_url" -o "$script_dir/$folder/$title/$pdf_name"
                    else
                        echo -e "can't download paper!"
                        continue
                    fi
                done
            fi
        fi
    done <"$script_dir/select"
    rm "$script_dir/select"
else
    rm "$script_dir/select"
    exit
fi
