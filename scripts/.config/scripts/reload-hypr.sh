#!/bin/sh

pkill waybar
pkill wallpapers.sh
pkill hyprpaper

hyprctl reload

sleep 0.2

waybar &
hyprpaper &
$HOME/.config/scripts/wallpapers.sh &
