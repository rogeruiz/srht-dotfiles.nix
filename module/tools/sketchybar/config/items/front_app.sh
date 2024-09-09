#!/bin/bash

properties=(
  icon.drawing=on
  label.font="RecMonoCasual Nerd Font:Regular:16"
  script="$PLUGIN_DIR/front_app.sh"
  updates=when_shown
  # label.padding_left="${margins}"
)
events=(
  front_app_switched
)

sketchybar --add item front_app left \
  --set front_app "${properties[@]}" \
  --subscribe front_app "${events[@]}"
