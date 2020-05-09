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

exec awesome
