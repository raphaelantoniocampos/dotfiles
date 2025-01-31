if type "xrandr"; then
  for m in $(xrandr --query | grep -e "Virtual1" -e "eDP-1" | grep "connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi
