#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

properties=(
  update_freq=1
  icon=
  # background.border_width=1
  # background.corner_radius=1
  icon.padding_left=10
  icon.padding_right=0
  label.padding_right=10
  script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock left --set clock "${properties[@]}"
