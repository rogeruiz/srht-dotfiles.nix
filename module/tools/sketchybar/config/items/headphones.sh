#!/bin/bash

properties=(
  # background.border_width=1
  # background.corner_radius=1
  background.padding_left=0
  background.padding_right=0
  icon.padding_left=10
  icon=󰋋
  label.padding_right=10
  script="$PLUGIN_DIR/ble_headset.sh"
)
events=(
  bt_connect
)

sketchybar --add event \
  bt_connect com.apple.bluetooth.status

sketchybar --add item headphones center \
  --set headphones "${properties[@]}" \
  --subscribe headphones "${events[@]}"
