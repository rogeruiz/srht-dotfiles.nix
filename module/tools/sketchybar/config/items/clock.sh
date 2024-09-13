#!/bin/bash

properties=(
  update_freq=1
  icon=
  script="$PLUGIN_DIR/clock.sh"
  label.padding_right="${margins}"
  background.border_width=1
)

sketchybar --add item clock left --set clock "${properties[@]}"
