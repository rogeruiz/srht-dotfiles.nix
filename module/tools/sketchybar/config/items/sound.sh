#!/bin/bash

properties=(
  script="$PLUGIN_DIR/sound.sh"
)
events=(
  volume_change
)

sketchybar --add item sound right \
  --set sound "${properties[@]}" \
  --subscribe sound "${events[@]}"
