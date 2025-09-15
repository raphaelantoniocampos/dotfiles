#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"

sleep 0.2

while true; do
  CURRENT_WALL=$(hyprctl hyprpaper listloaded)

  WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

  # Apply the selected wallpaper
  hyprctl hyprpaper reload ,"$WALLPAPER"
  hyprctl hyprpaper wallpaper ",$WALLPAPER"

  sleep 600 

done
