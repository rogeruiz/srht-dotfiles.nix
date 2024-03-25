#!/bin/zsh

SSID="$(
  networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //"
)"

CURR_FUERZA="󰤨"

if [[ -z "$SSID" ]]; then
  sketchybar --set $NAME label.drawing=off icon.padding_right=10 icon="󰖪"
else
  sketchybar --set $NAME label.drawing=on label="$SSID" icon.padding_right=0 icon=󰖩
fi
