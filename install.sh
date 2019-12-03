#!/bin/bash

PROJECT_DIR=$(cd "$(dirname "$0")";pwd)

echo "Configuration localtion: $PROJECT_DIR"

# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝
# ███████║██║   ██║██╔████╔██║█████╗
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

# rm ~/.xinitrc
# ln -s $PROJECT_DIR/xinitrc ~/.xinitrc

rm ~/.xprofile
ln -s $PROJECT_DIR/xprofile ~/.xprofile

rm ~/.Xresources
ln -s $PROJECT_DIR/Xresources ~/.Xresources


rm ~/.zshrc
ln -s $PROJECT_DIR/zshrc ~/.zshrc
rm ~/.zshenv
ln -s $PROJECT_DIR/zshenv ~/.zshenv

rm ~/.pam_environment
ln -s $PROJECT_DIR/pam_environment ~/.pam_environment


rm -rf ~/.emacs.d
ln -s $PROJECT_DIR/emacs.d ~/.emacs.d

#  ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
# ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
# ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
# ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
#  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝

rm ~/.config/ss.json
ln -s $PROJECT_DIR/hk.json ~/.config/ss.json

rm ~/.config/autorun.sh
ln -s $PROJECT_DIR/autorun.sh ~/.config/autorun.sh


rm -rf ~/.config/awesome
ln -s $PROJECT_DIR/awesome ~/.config/awesome

rm ~/.config/compton.conf
ln -s $PROJECT_DIR/compton.conf ~/.config/compton.blur.conf

# rm ~/.config/picom.conf
# ln -s $PROJECT_DIR/picom.conf ~/.config/picom.conf

rm -rf ~/.config/alacritty
ln -s $PROJECT_DIR/alacritty ~/.config/alacritty

rm -rf ~/.config/fcitx
ln -s $PROJECT_DIR/fcitx ~/.config/fcitx

rm -rf ~/.config/ranger
ln -s $PROJECT_DIR/ranger ~/.config/ranger

rm -rf ~/.config/rofi
ln -s $PROJECT_DIR/rofi ~/.config/rofi