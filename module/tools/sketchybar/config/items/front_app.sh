#!/bin/bash

properties=(
  # background.border_width=1
  # background.corner_radius=1
  background.padding_left=0
  background.padding_right=0
  icon.drawing=off
  label.font="RecMonoCasual Nerd Font:Regular:13.0"
  label.padding_left=10
  label.padding_right=10
  script="$PLUGIN_DIR/front_app.sh"
  updates=when_shown
)
events=(
  front_app_switched
)

sketchybar --add item front_app left \
  --set front_app "${properties[@]}" \
  --subscribe front_app "${events[@]}"
