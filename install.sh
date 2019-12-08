./uninstall.sh
mkdir -p ~/.local/bin
ln -s $(readlink -f paper-dl) ~/.local/bin/paper-dl
