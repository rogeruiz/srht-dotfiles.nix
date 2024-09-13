#!/bin/bash

properties=(
  script="$PLUGIN_DIR/battery.sh"
  background.border_width=1
)
events=(
  system_woke
  power_source_change
  brightness_change
  front_app_switched
)

sketchybar --add item battery right \
  --set battery "${properties[@]}" \
  --subscribe battery "${events[@]}"
