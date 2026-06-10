#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    hyprctl hyprpaper wallpaper ",$WALLPAPER"

    sleep 600
done
