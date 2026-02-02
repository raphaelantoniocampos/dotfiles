#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    icon="<span color='#94e2d5'></span>"
elif [ "$player_status" = "Paused" ]; then
    icon="<span color='#f38ba8'></span>"
else
    icon=""
fi

# Displays artist and title if player is playing or paused
if [ "$player_status" = "Playing" ] || [ "$player_status" = "Paused" ]; then
    echo "${icon}  $(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo ""
fi
