#!/bin/sh

LOG_FILE="/home/raphaelac/.update_history.log"

hyprctl notify 1 5000 0 "Performing System Update: Check $LOG_FILE for details."

echo "--- Update started at $(date) ---" | tee -a "$LOG_FILE"

zypper refresh && zypper dup --allow-vendor-change --recommends -y -l 2>&1 | tee -a "$LOG_FILE"

if [ $? -eq 0 ]; then
    hyprctl notify 5 5000 0 "Update Complete: System is up to date."
    echo "--- Update finished successfully at $(date) ---" >> "$LOG_FILE"
else
    hyprctl notify 3 8000 0 "Update Failed: Check $LOG_FILE for details."
    echo "--- Update FAILED at $(date) ---" >> "$LOG_FILE"
fi
