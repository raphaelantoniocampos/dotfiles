#!/bin/sh

LOG_FILE="/home/raphaelac/.update_history.log"
CLEAN_SCRIPT="/home/raphaelac/.config/scripts/zclean.sh"

hyprctl notify 1 5000 0 "Performing System Update: Check $LOG_FILE for details."

echo -e "\n--- Update started at $(date) ---" | tee -a "$LOG_FILE"

zypper refresh && zypper dup --allow-vendor-change --recommends -y -l 2>&1 | tee -a "$LOG_FILE"

sh "$CLEAN_SCRIPT" | tee -a "$LOG_FILE"

if [ $? -eq 0 ]; then
    hyprctl notify 5 5000 0 "Update Complete: System is up to date."
    echo -e "--- Update finished successfully at $(date) ---\n" >> "$LOG_FILE"
else
    hyprctl notify 3 8000 0 "Update Failed: Check $LOG_FILE for details."
    echo -e "--- Update FAILED at $(date) ---\n" >> "$LOG_FILE"
fi

