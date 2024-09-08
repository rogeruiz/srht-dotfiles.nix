#!/bin/bash

properties=(
  update_freq=1
  icon=
  script="$PLUGIN_DIR/clock.sh"
  label.padding_right=$((margins * 2))
  label.padding_left=0
)

sketchybar --add item clock left --set clock "${properties[@]}"
