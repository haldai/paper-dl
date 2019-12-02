black="\033[30m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
purple="\033[35m"
skyblue="\033[36m"
nc="\033[0m"

# create d "html" || create f "select.txt"
function create() {
    case "$1" in
    "d")
        if [ ! -d "$2" ]; then
            mkdir "$2"
        fi
        ;;
    "f")
        if [ -f "$2" ]; then
            rm "$2"
        else
            touch "$2"
        fi
        ;;
    esac
}

# delete d "html" || delete f "select.txt"
function delete() {
    case "$1" in
    "d")
        if [ -d "$2" ]; then
            rm -r "$2"
        fi
        ;;
    "f")
        if [ -f "$2" ]; then
            rm "$2"
        fi
        ;;
    esac
}

# d_curl "http://proceedings.mlr.press/" "html/jmlr root.html" [s]
function d_curl() {
    while [ ! -f "$2" ]; do
        if [ $(curl -o /dev/null -sIL -w %{http_code} "$1") == 200 ]; then
            if [ "$3" == "s" ]; then
                curl -s "$1" -o "$2"
            else
                curl "$1" -o "$2"
            fi
        else
            echo -e "${red}Can't download $1!${nc}" && exit 1
        fi
    done
}
