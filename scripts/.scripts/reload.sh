#!/bin/sh

pkill waybar
pkill swaync
hyprctl reload

sleep 0.1
waybar &
swaync &

SCRIPTS="${SCRIPTS%/}"
. "$SCRIPTS/wallpaper-picker.sh" random

exit 0

