#!/bin/bash

function update-yambar {
    echo "updates|string|"
    echo ""

    while true; do
        # Get the list of available updates using xbps-install -Mun
        updates=$(xbps-install -Mun 2>/dev/null)
        # Count the number of updates available
        number=$(echo "$updates" | grep -c "update")

        if [ "$number" -gt 0 ]; then
            text="  $number"
        else
            text=""
        fi

        echo "updates|string|$text"
        echo ""
        sleep 30m
    done
}

function update {
    foot bash -c "sudo xbps-install -u"; sh -c "~/.config/yambar/scripts/yambar-start.sh"
}

case $1 in
    update)
        update
        ;;
    *)
        update-yambar
        ;;
esac
exit 0
