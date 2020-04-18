#!/bin/sh

bar_music() {
	if [ "$(mpc status | grep playing)" == "" ]; then
		MPC="+<+<"
		#MPC=" 🎵 "
	else
		MPC=" $(mpc status --format "  %artist% - %title% ("$(mpc status | sed -n 2p | awk -F" " '{ print $3 }')")" | head -1)"
		#MPC=" $(mpc status --format "🎵  %artist% - %title% ("$(mpc status | sed -n 2p | awk -F" " '{ print $3 }')")" | head -1)"
	fi
	echo "$MPC"
}

bar_date() {
	DATE="$(date +"+<+<%a"\ "%d"\ "%h "\|\ \ "+<%H":"%M+<")"
	#DATE="$(date +"📅 %a"\ "%d"\ "%h "\|\ \ "🕑  %H":"%M")"
	echo "$DATE"
}

bar_battery() {
	CAPACITY="$(cat /sys/class/power_supply/BAT0/capacity)"
	STATUS="$(cat /sys/class/power_supply/BAT0/status)"
	[ "$CAPACITY" -lt 20 ] && [ "$STATUS" == "Discharging" ] && notify-send -t 3000 -u critical "BATTERY LOW" "Attach it to your charger\!"
	BAT_ICON=""
	#BAT_ICON="🔋"
	[ "$CAPACITY" -lt 80 ] && BAT_ICON=""
	[ "$CAPACITY" -lt 30 ] && BAT_ICON=""
	#[ "$STATUS" == "Charging" ] && BAT_ICON="🔌"
	[ "$STATUS" == "Charging" ] && BAT_ICON=""
	BATTERY="+<$BAT_ICON+<$CAPACITY%+<"
	echo "$BATTERY"
}

bar_volume() {
	if [ "$(amixer get Master | awk -F'[][]' 'END{ print $6 }')" == "off" ]; then
		VOLUME="+<x+<$(amixer get Master | awk -F'[][]' 'END{ print $2 }')+<"
		#VOLUME="🛑 $(amixer get Master | awk -F'[][]' 'END{ print $2 }')"
	else
		VOLUME="+<+<$(amixer get Master | awk -F'[][]' 'END{ print $2 }')+<"
		#VOLUME="🔊  $(amixer get Master | awk -F'[][]' 'END{ print $2 }')"
	fi
	echo "$VOLUME"
}

bar_cpu() {
	CPU="+<+<$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')%+<"
	#CPU="🖥  $(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
	echo "$CPU"
}

bar_ram() {
	RAM="+<+<$(free -m | awk 'NR==2{printf "%s/%sMB\n", $3,$2 }')+<"
	#RAM="💾  $(free -m | awk 'NR==2{printf "%s/%sMB\n", $3,$2 }')"
	echo "$RAM"
}

while :; do
	echo -e "+@bg=2;+@fg=1;+<$(bar_music)+<+@bg=3;+@fg=1;+<$(bar_ram)+<+@bg=4;+@fg=1;+<$(bar_cpu)+<+@bg=5;+@fg=2;+<$(bar_volume)+<+@bg=6;+@fg=2;+<$(bar_date)+<+@bg=5;+@fg=2;+<$(bar_battery)+<"
	sleep 1
done
