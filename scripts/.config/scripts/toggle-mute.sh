#!/usr/bin/env bash

# Checa se estamos lidando com o output (alto-falante) ou input (microfone)
TARGET=$1
if [[ "$TARGET" == "sink" ]]; then
    NODE="@DEFAULT_AUDIO_SINK@"
    LABEL="Volume"
    ICON_MUTED=""   # volume mudo (Font Awesome ou Nerd Font)
    ICON_UNMUTED="" # volume normal
else
    NODE="@DEFAULT_AUDIO_SOURCE@"
    LABEL="Mic"
    ICON_MUTED=""   # microfone mudo
    ICON_UNMUTED="" # microfone ativo
fi

# Inverte mute
wpctl set-mute "$NODE" toggle

# Pega estado atual
STATE=$(wpctl get-volume "$NODE")

if [[ "$STATE" == *"[MUTED]"* ]]; then
    hyprctl notify 3 2000 0 "$LABEL: $ICON_MUTED"
else
    hyprctl notify 5 2000 0 "$LABEL: $ICON_UNMUTED"
fi
