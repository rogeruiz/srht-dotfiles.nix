#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

properties=(
  # background.border_width=1
  # background.corner_radius=1
  icon.padding_left=10
  icon.padding_right=5
  label.padding_right=10
  script="$PLUGIN_DIR/sound.sh"
)
events=(
  volume_change
)

sketchybar --add item sound right \
  --set sound "${properties[@]}" \
  --subscribe sound "${events[@]}"
