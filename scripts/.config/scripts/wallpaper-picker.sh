#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"

SELECTED=$(imv -n 1 "$WALLPAPER_DIR")

if [ -n "$SELECTED" ]; then
    IMAGE=$(echo "$SELECTED" | tail -n 1)
    
    matugen image "$IMAGE" --prefer value
    notify-send "Changed Wallpaper" "Themes successfully updated."
else
    notify-send "Selection Canceled" "No wallpaper was selected."
fi
