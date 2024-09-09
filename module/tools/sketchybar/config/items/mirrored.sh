#!/bin/bash

keyboard_alias_properties=(
  icon=
  icon.padding_right=0
  label.drawing=off
  background.border_width=1
)
# cpu_properties=(
#   icon=
#   icon.padding_right=0
#   label.drawing=off
#   background.border_width=1
# )
# ram_properties=(
#   icon=
#   icon.padding_right=0
#   label.drawing=off
#   background.border_width=1
# )

sketchybar --add alias "TextInputMenuAgent,Item-0" right \
  --set "TextInputMenuAgent,Item-0" "${keyboard_alias_properties[@]}"
# --add alias "Stats,RAM_mini" left \
# --set "Stats,RAM_mini" "${ram_properties[@]}" \
# --add alias "Stats,CPU_mini" left \
# --set "Stats,CPU_mini" "${cpu_properties[@]}"
