./uninstall.sh

mkdir -p $HOME/.config
cp paper-dl.conf $HOME/.config/

mkdir -p $HOME/.local/bin # remember to add $HOME/.local/bin to $PATH
ln -s $(readlink -f paper-dl) $HOME/.local/bin/paper-dl
ln -s $(readlink -f paper-dl-util) $HOME/.local/bin/paper-dl-util
