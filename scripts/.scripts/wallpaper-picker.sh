#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"

if [[ "$1" == "random" ]]; then
    IMAGE=$(find "$WALLPAPER_DIR" | shuf -n 1)
    
    if [ -z "$IMAGE" ]; then
        notify-send "Erro" "Nenhum wallpaper encontrado no diretório."
        exit 1
    fi
else
    SELECTED=$(imv -n 1 "$WALLPAPER_DIR")

    if [ -n "$SELECTED" ]; then
        IMAGE=$(echo "$SELECTED" | tail -n 1)
    else
        notify-send "Selection Canceled" "No wallpaper was selected."
        exit 0
    fi
fi

matugen image "$IMAGE" --prefer value
notify-send "Changed Wallpaper" "Themes successfully updated para: $(basename "$IMAGE")"
exit 0
