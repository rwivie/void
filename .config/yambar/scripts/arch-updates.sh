#!/bin/bash

function update-yambar {
echo "updates|string|"
echo ""

while true; do

#xbps-install -Mun 1> /tmp/void-updates
# updates="$(cat /tmp/void-updates | awk '{ print $1 }')"
# number="$(cat /tmp/void-updates | wc -l)"
#
# if [ "$number" -gt 0 ]; then
#     text=" $number"
# else
#     text=""
# fi
updates="$(checkupdates;yay -Qum)"
arch="$(checkupdates | wc -l)"
aur="$(yay -Qum | wc -l)"
number=$((arch+aur))

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
	foot bash -c "paru"; sh -c "~/.config/yambar/scripts/yambar-start.sh"
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
