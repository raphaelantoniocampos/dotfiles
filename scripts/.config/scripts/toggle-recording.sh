#!/bin/env bash

RECORDING_DIR="$HOME/Videos/recordings"
DATE_FORMAT=$(date +%Y-%m-%d_%H-%M-%S)
NOTIFY_TIMEOUT=3000 # 3 seconds

if pgrep -x "wf-recorder" > /dev/null; then
    pkill -INT -x wf-recorder
    
    hyprctl notify 5 $NOTIFY_TIMEOUT 0 "Stopped Recording"
else
    wf-recorder -f "$RECORDING_DIR/$DATE_FORMAT.mkv" & 
    
    hyprctl notify 1 $NOTIFY_TIMEOUT 0 "Recording Started: $DATE_FORMAT.mkv"
fi

exit 0
