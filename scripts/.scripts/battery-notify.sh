#!/bin/sh

BAT_PATH="/sys/class/power_supply/BAT1"

# Sounds
SND_CHANGE="/usr/share/sounds/freedesktop/stereo/dialog-information.oga"
SND_FULL="/usr/share/sounds/freedesktop/stereo/complete.oga"
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
          if [ "$bat_status" != "$last_status" ]; then
            notify-send -u low "Charging - ${bat_lvl}%"
            pw-play "$SND_CHANGE" >/dev/null 2>&1 &
            brightnessctl set 100%
            last_notify=$bat_status
          fi
        ;;
      "Full")
        notify-send -u low "Battery Full - ${bat_lvl}%"
        pw-play "$SND_FULL" >/dev/null 2>&1 &
        last_notify=$bat_status
        ;;
      "Discharging")
        if [ "$bat_lvl" -le 5 ]; then
          if [ "$last_notify" != "$bat_status" ]; then
            notify-send -u critical "CRITICAL - ${bat_lvl}%"
            pw-play "$SND_CRITICAL" >/dev/null 2>&1 &
            [ "$brightness" -gt 240 ] && brightnessctl set 30%
            last_notify=$bat_status
          fi
        elif [ "$bat_lvl" -le 15 ]; then
          if [ "$last_notify" != "$bat_status" ]; then
            notify-send -u normal "Battery Low - ${bat_lvl}%"
            pw-play "$SND_CHANGE" >/dev/null 2>&1 &
            last_notify=$bat_status
          fi
        fi
        ;;
    esac
  fi

  echo "last_lvl: ${last_lvl}"
  echo "bat_lvl: ${bat_lvl}"
  echo "last_status: ${last_status}"
  echo "bat_status: ${bat_status}"
  echo "last_notify: ${last_notify}"
  last_lvl=$bat_lvl
  last_status=$bat_status

  sleep 1
done

