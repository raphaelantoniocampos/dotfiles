#!/bin/sh

pkill waybar
pkill hyprpaper

hyprctl reload

sleep 0.2

hyprpaper &
waybar &
