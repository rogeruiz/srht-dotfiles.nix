#!/bin/bash

properties=(
  label.max_chars=30
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
