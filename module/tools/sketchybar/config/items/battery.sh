#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

properties=(
  # background.border_width=3
  # background.corner_radius=3
  background.padding_left=0
  background.padding_right=0
  icon.padding_left=10
  icon.padding_right=0
  label.padding_right=10
  script="$PLUGIN_DIR/battery.sh"
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
