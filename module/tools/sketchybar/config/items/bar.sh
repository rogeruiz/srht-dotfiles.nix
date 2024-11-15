#!/usr/bin/env bash

# SketchyBar Bar (base) component
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

config=(
  height="${altura}"
  corner_radius=0
  margin="${gaps}"
  y_offset=$((bar_yoffset))
  padding_left="${margins}"
  padding_right="${margins}"
  border_width=1
  corner_radius=8
)

sketchybar --bar "${config[@]}"
