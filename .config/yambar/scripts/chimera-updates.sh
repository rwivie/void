#!/bin/bash

function update-yambar {
echo "updates|string|"
echo ""

while true; do

doas apk update &>/dev/null
updates="$(apk -u list | awk '{ print $1 }')"
number="$(apk -u list | wc -l | awk '{$1=$1};1')"

if [ "$number" -gt 0 ]; then
    text=" $number"
else
    text=""
fi

echo "updates|string|$text"
echo ""
sleep 30m

done
}

function update {
	foot bash -c "doas apk upgrade"; sh -c "~/.config/yambar/scripts/yambar-start.sh"
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
