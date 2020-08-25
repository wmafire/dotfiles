#!/bin/sh

#
# ~/.xinitrc
#

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if [ -n "$GTK_MODULES" ]; then
    # GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
# else
    # GTK_MODULES="appmenu-gtk-module"
# fi

# if [ -z "$UBUNTU_MENUPROXY" ]; then
    # UBUNTU_MENUPROXY=1
# fi

# export APPMENU_DISPLAY_BOTH=1

# export GTK_MODULES
# export UBUNTU_MENUPROXY
# export UNITY_GTK_MENU_SHELL_DEBUG = "true"
# export UNITY_GTK_MENU_SHELL_DEBUG = "true"
# export UNITY_GTK_ACTION_GROUP_DEBUG = "true"

[ -f ~/.xprofile ] && source ~/.xprofile

xrdb -merge ~/.Xresources
setxkbmap -option caps:ctrl_modifier
xset r rate 300 30

[ -f ~/.autostart.sh ] && source ~/.autostart.sh

mkdir -p /tmp/awesome
exec awesome >> /tmp/awesome/stdout 2>> /tmp/awesome/stderr
