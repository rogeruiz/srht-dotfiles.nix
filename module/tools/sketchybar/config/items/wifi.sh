#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

properties=(
  # background.border_width=3
  # background.corner_radius=3
  background.padding_left=0
  background.padding_right=0
  icon.padding_left=10
  label.max_chars=30
  label.padding_right=10
  label.scroll_duration=920
  script="$PLUGIN_DIR/wifi.sh"
  scroll_texts=on
)

events=(
  wifi_config
)

sketchybar --add item wifi right \
  --set wifi "${properties[@]}" \
  --subscribe wifi "${events[@]}"
