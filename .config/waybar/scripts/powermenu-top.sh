#!/usr/bin/env bash

op=$( echo -e " Poweroff\n  Reboot\n Suspend\n Lock\n Logout" | wofi -D hide_search=true -l 3 -L 6 --conf=$HOME/.config/wofi/config.power_top --style=$HOME/.config/wofi/style_power.css | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
		lockway
                ;;
        logout)
                swaymsg exit
                ;;
esac