#!/bin/bash

properties=(
  display=1
  icon=󰋋
  script="$PLUGIN_DIR/ble_headset.sh"
  updates=on
)
events=(
  bt_connect
)

sketchybar --add event \
  bt_connect com.apple.bluetooth.status

sketchybar --add item headphones center \
  --set headphones "${properties[@]}" \
  --subscribe headphones "${events[@]}"
