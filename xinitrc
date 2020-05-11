#!/bin/sh

#
# ~/.xinitrc
#

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -f ~/.xprofile ] && source ~/.xprofile

xrdb -merge ~/.Xresources 
setxkbmap -option caps:ctrl_modifier

[ -f ~/.autostart.sh ] && source ~/.autostart.sh

mkdir -p /tmp/awesome
exec awesome >> /tmp/awesome/stdout 2>> /tmp/awesome/stderr
