#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

icons=(
  "I"
  "II"
  "III"
  "IV"
  "V"
  "VI"
  "VII"
  "VIII"
  "IX"
  "X"
  "XI"
  "XII"
  "XIII"
  "XIV"
  "XV"
)

styles=(
  # icon.font="RecMonoCasual Nerd Font:Regular:18.0"
  # label.font="RecMonoCasual Nerd Font:Regular:18.0"
  # background.drawing=off
  icon.padding_left=5
  icon.padding_right=5
  label.drawing=off
  script="$PLUGIN_DIR/space.sh"
)
events=(
  system_woke
)

for i in "${!icons[@]}"; do
  sid=$((i + 1))
  sketchybar --add space space.$sid left
  sketchybar --set space.$sid \
    associated_space=$sid \
    icon="${icons[i]}" \
    "${styles[@]}" \
    --subscribe space.$sid "${events[@]}"
done

bg_styles=(
  background.drawing=on
  background.padding_left=10
  background.padding_right=10
  # background.border_width=1
)

sketchybar --add bracket spaces '/space\..*/' \
  --set spaces "${bg_styles[@]}"
