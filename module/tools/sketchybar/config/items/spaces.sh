#!/bin/bash

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
  icon.padding_left=$((margins / 2))
  icon.padding_right=$((margins / 2))
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
)

sketchybar --add bracket spaces '/space\..*/' \
  --set spaces "${bg_styles[@]}"
