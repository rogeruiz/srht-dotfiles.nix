#!/usr/bin/env bash
#
# SketchyBar Space(s) component
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

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
  icon.padding_left=$((margins / 4))
  icon.padding_right=$((margins / 4))
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
  padding_left="${margins}"
  padding_right="${margins}"
)

sketchybar --add bracket spaces '/space\..*/' \
  --set spaces "${bg_styles[@]}"
