#!/bin/sh

# Check if we are dealing with the output (speaker) or input (microphone)
TARGET=$1
if [[ "$TARGET" == "sink" ]]; then
    NODE="@DEFAULT_AUDIO_SINK@"
    LABEL="Volume"
    ICON_MUTED=""   # muted volume (Font Awesome or Nerd Font)
    ICON_UNMUTED=" " # normal volume
else
    NODE="@DEFAULT_AUDIO_SOURCE@"
    LABEL="Mic"
    ICON_MUTED=" "   # muted mic
    ICON_UNMUTED="" # active mic
fi

# toggle mute
wpctl set-mute "$NODE" toggle

# Get current status
STATE=$(wpctl get-volume "$NODE")

if [[ "$STATE" == *"[MUTED]"* ]]; then
    notify-send -u critical -t 2000 "$LABEL: MUTED $ICON_MUTED"
else
    notify-send -u low -t 2000 "$LABEL: UNMUTED $ICON_UNMUTED"
fi
