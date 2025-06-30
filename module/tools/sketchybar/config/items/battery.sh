#!/usr/bin/env bash

# SketchyBar Battery component
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

properties=(
  script="$PLUGIN_DIR/battery.sh"
)
events=(
  system_woke
  power_source_change
  brightness_change
  front_app_switched
)

sketchybar --add item battery right \
  --set battery "${properties[@]}" \
  --subscribe battery "${events[@]}"
