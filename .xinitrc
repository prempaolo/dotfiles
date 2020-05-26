#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

while :; do
	ssh-agent dwm
done
#exec wmaker
#exec awesome
#exec bspwm
#exec spectrwm
# In order to have the logs for awesome comment the previus line and uncomment the following one
#exec /usr/bin/awesome >> ~/aw-stdout 2>> ~/aw-stderr
