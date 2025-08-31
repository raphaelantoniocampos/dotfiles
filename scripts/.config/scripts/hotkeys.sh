#!/usr/bin/env bash

CONF="$HOME/.config/hypr/hyprland.conf"

grep "^bind" "$CONF" | \
  sed 's/^bind = //; s/, /,/g' | \
  awk -F',' '{
    if ($2 != "") {
      key = $1 " " $2
      cmd = $3
      for (i=4; i<=NF; i++) cmd=cmd "," $i
    } else {
      key = $1
      cmd = $2
      for (i=3; i<=NF; i++) cmd=cmd "," $i
    }
    printf "%-20s → %s\n", key, cmd
  }' | \
  wofi --dmenu --prompt "Hotkeys"

