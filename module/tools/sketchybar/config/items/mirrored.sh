#!/usr/bin/env bash

# SketchyBar Mirrored Menu Bar Items component
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

keyboard_alias_properties=(
  icon=
  label.drawing=off
)
# cpu_properties=(
#   icon=
#   icon.padding_right=0
#   label.drawing=off
# )
# ram_properties=(
#   icon=
#   icon.padding_right=0
#   label.drawing=off
# )

sketchybar --add alias "TextInputMenuAgent,Item-0" right \
  --set "TextInputMenuAgent,Item-0" "${keyboard_alias_properties[@]}"
# --add alias "Stats,RAM_mini" left \
# --set "Stats,RAM_mini" "${ram_properties[@]}" \
# --add alias "Stats,CPU_mini" left \
# --set "Stats,CPU_mini" "${cpu_properties[@]}"
