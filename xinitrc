#!/bin/sh

#
# ~/.xinitrc
#

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

xrdb -merge ~/.Xresources

[ -f ~/.xprofile ] && source ~/.xprofile

exec awesome
