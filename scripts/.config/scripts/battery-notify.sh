#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT1"

# Sounds
SND_CHARGE="/usr/share/sounds/freedesktop/stereo/dialog-information.oga"
SND_FULL="/usr/share/sounds/freedesktop/stereo/complete.oga"
SND_LOW="/usr/share/sounds/freedesktop/stereo/bell.oga"
SND_CRITICAL="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

last_status=""
last_lvl=0

notify_and_sound() {
  hyprctl notify "$1" "$2" 0 "$3"
  [ -f "$4" ] && pw-play "$4" >/dev/null 2>&1 &
}

while true; do
  bat_lvl=$(<"$BAT_PATH/capacity")
  bat_status=$(<"$BAT_PATH/status")
  brightness=$(brightnessctl get)

  if [[ "$bat_status" != "$last_status" ]]; then
    case "$bat_status" in
      "Charging")
        if [ "$brightness" -le 240 ]; then
          notify_and_sound 5 3000 "Charging - ${bat_lvl}%" "$SND_CHARGE"
          brightnessctl set 100%
        fi
        ;;
      "Full")
        notify_and_sound 5 3000 "Battery Full - ${bat_lvl}%" "$SND_FULL"
        ;;
      "Discharging")
        if [ "$bat_lvl" -le 5 ]; then
          notify_and_sound 3 10000 "CRITICAL - ${bat_lvl}%" "$SND_CRITICAL"
          [ "$brightness" -gt 240 ] && brightnessctl set 30%
        elif [ "$bat_lvl" -le 15 ]; then
          notify_and_sound 0 3000 "Battery Low - ${bat_lvl}%" "$SND_LOW"
        fi
        ;;
    esac
  fi

  last_lvl=$bat_lvl
  last_status=$bat_status

  # Dynamic sleep
  if [ "$bat_lvl" -le 5 ]; then
    sleep 20
  elif [ "$bat_lvl" -le 15 ]; then
    sleep 60
  elif [ "$bat_lvl" -le 30 ]; then
    sleep 120
  else
    sleep 300
  fi
done

