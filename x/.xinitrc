#!/bin/sh

[ -f ~/.xprofile ] && source ~/.xprofile

xrdb -merge ~/.Xresources
setxkbmap -option caps:ctrl_modifier
xset r rate 300 30

# [ -f ~/.autostart.sh ] && source ~/.autostart.sh

function run {
   if (command -v $1); then
     $@&
   fi
}

cd ~/.config/clash/dashboard && python -m http.server 7899 &
run picom
run fcitx
run emacs --daemon
#run lxsession -s awesome -e awesome
run pkttyagent
run flameshot
run enpass
run nutstore
run keepassxc
run pa-applet
# picom --experimental-backend

killall awesome
mkdir -p /tmp/awesome
exec awesome >> /tmp/awesome/stdout 2>> /tmp/awesome/stderr
#exec startxfce4
