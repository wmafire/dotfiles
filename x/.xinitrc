#!/bin/sh

[ -f ~/.xprofile ] && source ~/.xprofile

killall awesome
mkdir -p /tmp/awesome
exec awesome >> /tmp/awesome/stdout 2>> /tmp/awesome/stderr
#exec startxfce4
