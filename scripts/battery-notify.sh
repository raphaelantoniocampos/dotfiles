#!/bin/bash
while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
  bat_status=$(cat /sys/class/power_supply/BAT1/status)
  brightness=$(brightnessctl get)

  if [ "$bat_status" = "Charging" ]; then
    if [ "$brightness" -le 240 ]; then
      hyprctl notify 5 3000 0 "Battery Charging - Level: ${bat_lvl}%"
      brightnessctl set 100%
    fi
    sleep 30
    continue

  elif [ "$bat_status" = "Full" ]; then
    hyprctl notify 5 3000 0 "Battery Full - Level: ${bat_lvl}%"
    sleep 300

  elif [ "$bat_lvl" -le 5 ]; then
    hyprctl notify 3 10000 0 "⚠ CRITICAL Battery - Level: ${bat_lvl}%"

    if [ "$brightness" != 240 ]; then
      brightnessctl set 30%
    fi
    sleep 1

  elif [ "$bat_lvl" -le 15 ]; then
    hyprctl notify 0 3000 0 "Battery Low - Level: ${bat_lvl}%"
    sleep 15 

  elif [ "$bat_lvl" -le 30 ]; then
    sleep 30

  else
    sleep 120
  fi
done
