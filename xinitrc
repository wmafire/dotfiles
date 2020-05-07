#!/bin/sh

#
# ~/.xinitrc
#

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

setxkbmap -option caps:ctrl_modifier

[ -f ~/.xprofile ] && source ~/.xprofile

xrdb -merge ~/.Xresources 

/usr/bin/start-pulseaudio-x11

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1

exec awesome
