#!/bin/env bash

RECORDING_DIR="$HOME/Videos/recordings"
DATE_FORMAT=$(date +%Y-%m-%d_%H-%M-%S)
NOTIFY_TIMEOUT=2000
DEVICE_NAME=$(pactl list sources | grep 'Name:' | head -n 1 | awk '{print $2}')

if pgrep -x "wf-recorder" > /dev/null; then
    pkill -INT -x wf-recorder
    
    notify-send -u low -t $NOTIFY_TIMEOUT "Stopped Recording"
else
    notify-send -u low -t $NOTIFY_TIMEOUT "Recording Starting in 2.0 seconds..."

    sleep 2

    wf-recorder -a="$DEVICE_NAME" -f "$RECORDING_DIR/$DATE_FORMAT.mp4" & 
    
fi

exit 0
