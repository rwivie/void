#!/bin/bash

#read -r wallpaper<~/.cache/wallpaper
#export wallpaper=$( echo $wallpaper)

# River swayidle toggle
function toggle {
if pgrep "swayidle" > /dev/null
then
	pkill swayidle
	notify-send -u normal "  Swayidle Inactive" --hint=string:x-canonical-private-synchronous:idleinhibit 
else
	#swayidle -w \
	#timeout 300 'swaylock -f -i $wallpaper' \
	#timeout 600 'wlopm --off \*;swaylock -F -i $wallpaper' resume 'wlopm --on \*' \
	#before-sleep 'swaylock -f -i $wallpaper' &
	swayidle \
	timeout 900 'lockit' \
	timeout 1200 'wlr-randr --output DP-3 --off' \
	resume 'wlr-randr --output DP-3 --on' \
	before-sleep 'lockit' &
	notify-send -u normal "  Swayidle Active" --hint=string:x-canonical-private-synchronous:idleinhibit
fi
}

case $1 in
	toggle)
		toggle
		;;
	*)
		while true; do
		if pgrep "swayidle" > /dev/null
		then
			icon=" "
		else
			icon=" "
		fi
		echo "idleinhibit|string|$icon"
		echo ""
		sleep 1
	        done
		;;
esac
exit 0
