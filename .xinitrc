#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

while :; do
	ssh-agent dwm
done
#exec awesome
#exec bspwm
# In order to have the logs for awesome comment the previus line and uncomment the following one
#exec /usr/bin/awesome >> ~/aw-stdout 2>> ~/aw-stderr
