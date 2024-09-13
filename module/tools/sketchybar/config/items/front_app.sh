#!/bin/bash

properties=(
  icon.drawing=on
  label.font="RecMonoCasual Nerd Font:Regular:16"
  script="$PLUGIN_DIR/front_app.sh"
  updates=when_shown
  background.border_width=1
)
events=(
  front_app_switched
)

sketchybar --add item front_app left \
  --set front_app "${properties[@]}" \
  --subscribe front_app "${events[@]}"
