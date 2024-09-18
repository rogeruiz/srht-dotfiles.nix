#!/bin/bash

properties=(
  label.max_chars=30
  label.scroll_duration=720
  script="$PLUGIN_DIR/wifi.sh"
  scroll_texts=on
  background.border_width=1
  updates=on
)
network_properties=(
  icon=󰛳
  icon.padding_right=0
  label.drawing=off
  background.border_width=1
)

events=(
  wifi_config
  mouse.entered
  system_woke
)

sketchybar --add alias "Stats,Network_network_chart" right \
  --set "Stats,Network_network_chart" "${network_properties[@]}" \
  --add item wifi right \
  --set wifi "${properties[@]}" \
  --subscribe wifi "${events[@]}"
