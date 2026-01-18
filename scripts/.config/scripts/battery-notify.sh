#!/bin/sh

BAT_PATH="/sys/class/power_supply/BAT1"

# Sounds
SND_CHARGE="/usr/share/sounds/freedesktop/stereo/dialog-information.oga"
SND_FULL="/usr/share/sounds/freedesktop/stereo/complete.oga"
SND_LOW="/usr/share/sounds/freedesktop/stereo/bell.oga"
SND_CRITICAL="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

last_status=""
last_lvl=0
last_notify=""

while true; do
  bat_lvl=$(<"$BAT_PATH/capacity")
  bat_status=$(<"$BAT_PATH/status")
  brightness=$(brightnessctl get)

  if [[ "$bat_lvl" != "$last_lvl" || "$bat_status" != "$last_status" ]]; then
    case "$bat_status" in
      "Charging")
        if [ "$last_status" != "$bat_status" ]; then
          notify-send -u low "Charging - ${bat_lvl}%"
          pw-play "$SND_CHARGE" >/dev/null 2>&1 &
          brightnessctl set 100%
        fi
        ;;
      "Full")
        notify-send -u low "Battery Full - ${bat_lvl}%"
        pw-play "$SND_FULL" >/dev/null 2>&1 &
        ;;
      "Discharging")
        if [ "$bat_lvl" -le 5 ]; then
          notify-send -u critical "CRITICAL - ${bat_lvl}%"
          pw-play "$SND_CRITICAL" >/dev/null 2>&1 &
          [ "$brightness" -gt 240 ] && brightnessctl set 30%
        elif [ "$bat_lvl" -le 15 ]; then
          notify-send -u normal "Battery Low - ${bat_lvl}%" "$SND_LOW" "low"
          pw-play "$SND_LOW" >/dev/null 2>&1 &
        fi
        ;;
    esac
  fi

  last_lvl=$bat_lvl
  last_status=$bat_status

  sleep 1
done

