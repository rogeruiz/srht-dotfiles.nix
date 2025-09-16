#!/usr/bin/env bash

# SketchyBar Front Application component
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
  icon.drawing=on
  label.font.style=italic
  script="$PLUGIN_DIR/front_app.sh"
  updates=when_shown
)
events=(
  front_app_switched
)

sketchybar --add item front_app center \
  --set front_app "${properties[@]}" \
  --subscribe front_app "${events[@]}"
