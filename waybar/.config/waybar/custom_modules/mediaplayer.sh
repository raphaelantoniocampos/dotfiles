#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    icon="<span color='#94e2d5'></span>"
elif [ "$player_status" = "Paused" ]; then
    icon="<span color='#f38ba8'></span>"
else
    icon=""
fi

# Exibe o artista e o título se o player estiver tocando ou pausado
if [ "$player_status" = "Playing" ] || [ "$player_status" = "Paused" ]; then
    echo "${icon}  $(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo ""
fi
