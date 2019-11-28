#!/usr/bin/env bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ ${#@} == 0 ]; then
    echo "please input the year!"
    exit
fi

script_dir=$(dirname $0)

host=http://papers.nips.cc
while [ ! -f "$script_dir/temporary files/nips root.html" ]; do
    if [ $(curl -o /dev/null -sIL -w %{http_code} $host) == 200 ]; then
        curl -s "$host" -o "$script_dir/temporary files/nips root.html"
    else
        echo -e "can't download $host!"
        exit
    fi
done

year_url=$(cat "$script_dir/temporary files/nips root.html" | grep "NIPS $1" | sed -e "s/.*href=\"\(.*\)\".*/\1/g")
rm "$script_dir/temporary files/nips root.html"

if [ -z "$year_url" ]; then
    echo -e "illegal input year, exit!"
    exit
fi

while [ ! -f "$script_dir/temporary files/nips $1.html" ]; do
    if [ $(curl -o /dev/null -sIL -w %{http_code} "$host$year_url") == 200 ]; then
        curl -s "$host$year_url" -o "$script_dir/temporary files/nips $1.html"
    else
        echo -e "can't download $host$year_url!"
        exit
    fi
done

if [ -f "$script_dir/select" ]; then
    rm "$script_dir/select"
else
    touch "$script_dir/select"
fi

if [ ${#@} == 1 ]; then
    total=$(cat "$script_dir/temporary files/nips $1.html" | grep href=\"/paper | wc -l)
    while read -r line; do
        if [[ "$line" =~ "<li><a href=\"/paper" ]]; then
            echo $line | cut -d '>' -f 2 | sed -e "s/.*href=\"\(.*\)\".*/\1/g" >>"$script_dir/select"
        fi
    done <"$script_dir/temporary files/nips $1.html"
else
    total=0
    while read -r line; do
        if [[ "$line" =~ "<li><a href=\"/paper" ]]; then
            keywords_find=1
            for arg in $@; do
                arg=${arg,,}
                if [ "$arg" != "$1" ] && [[ ! "$line" =~ "$arg" ]] && [[ ! "$line" =~ "${arg^}" ]] && [[ ! "$line" =~ "${arg,}" ]] && [[ ! "$line" =~ "${arg^^}" ]]; then
                    keywords_find=0
                fi
            done
            if [ "$keywords_find" == 1 ]; then
                ((total++))
                echo $line | cut -d '>' -f 2 | sed -e "s/.*href=\"\(.*\)\".*/\1/g" >>"$script_dir/select"
            fi
        fi
    done <"$script_dir/temporary files/nips $1.html"
fi
# rm "$script_dir/temporary files/nips $1.html"

if [ $total -gt 0 ]; then
    num=0
    while read -r line; do
        ((num++))
        echo "$num. $(echo $line | cut -d '/' -f 3)"
    done <"$script_dir/select"
    echo ""
    read -p "find $total paper(s), download them all (Y/n): " start
else
    echo -e "no papers meet the query conditions!"
    rm "$script_dir/select"
    exit
fi

if [ "$start" != 'n' ]; then
    folder=$(echo $year_url | cut -d '/' -f 3)
    if [ ! -d "$script_dir/$folder" ]; then
        mkdir "$script_dir/$folder"
    fi

    num=0
    while read -r line; do
        ((num++))
        echo ""

        paper_name=$(echo $line | cut -d '/' -f 3)
        paper_id=$(echo $paper_name | cut -d '-' -f 1)

        awk 'BEGIN{printf "%d/%d (%.2f%)", '$num', '$total', (100 * '$num'/'$total')}'
        echo "  $paper_name"

        while [ ! -f "$script_dir/$folder/$paper_id.html" ]; do
            if [ $(curl -o /dev/null -sIL -w %{http_code} "$host$line") == 200 ]; then
                curl -s "$host$line" -o "$script_dir/$folder/$paper_id.html"
            else
                echo -e "can't download paper page!"
                continue
            fi
        done

        if [ ! -d "$script_dir/$folder/$paper_name" ]; then
            mkdir "$script_dir/$folder/$paper_name"
        fi

        pdf_url=$(cat "$script_dir/$folder/$paper_id.html" | grep "PDF" | sed -e "s/.*href=\"\(.*\)\".*/\1/g")
        while [ ! -f "$script_dir/$folder/$paper_name/$paper_name.pdf" ]; do
            if [ $(curl -o /dev/null -sIL -w %{http_code} "$host$pdf_url") == 200 ]; then
                echo -e "download paper:"
                curl "$host$pdf_url" -o "$script_dir/$folder/$paper_name/$paper_name.pdf"
            else
                echo -e "can't download paper:"
            fi
        done

        bib_url=$(cat "$script_dir/$folder/$paper_id.html" | grep "BibTeX" | sed -e "s/.*href=\"\(.*\)\".*/\1/g")
        while [ ! -f "$script_dir/$folder/$paper_name/$paper_name.bib" ]; do
            if [ $(curl -o /dev/null -sIL -w %{http_code} "$host$bib_url") == 200 ]; then
                echo -e "download bib:"
                curl "$host$bib_url" -o "$script_dir/$folder/$paper_name/$paper_name.bib"
            else
                echo -e "can't download bib:"
            fi
        done

        supplemental_url=$(cat "$script_dir/$folder/$paper_id.html" | grep "Supplemental" | sed -e "s/.*href=\"\(.*\)\".*/\1/g")
        while [ ! -f "$script_dir/$folder/$paper_name/$paper_name.zip" ]; do
            if [ $(curl -o /dev/null -sIL -w %{http_code} "$host$supplemental_url") == 200 ]; then
                echo -e "download supplemental:"
                curl "$host$supplemental_url" -o "$script_dir/$folder/$paper_name/$paper_name.zip"
            else
                echo -e "can't download supplemental:"
            fi
        done

        review_url=$(cat "$script_dir/$folder/$paper_id.html" | grep "Reviews" | sed -e "s/.*media\(.*\)\".*/media\1/g")
        while [ ! -f "$script_dir/$folder/$paper_name/review.html" ]; do
            if [ $(curl -o /dev/null -sIL -w %{http_code} "$review_url") == 200 ]; then
                echo -e "download review:"
                curl "$review_url" -o "$script_dir/$folder/$paper_name/review.html"
            else
                echo -e "can't download review:"
            fi
        done

        rm "$script_dir/$folder/$paper_id.html"
    done <"$script_dir/select"
    rm "$script_dir/select"
else
    rm "$script_dir/select"
    exit
fi
