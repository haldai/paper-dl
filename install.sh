if [ -n "$1"]; then
    sudo cp ./paper-dl $1
else
    sudo cp ./paper-dl /usr/local/bin/
fi
