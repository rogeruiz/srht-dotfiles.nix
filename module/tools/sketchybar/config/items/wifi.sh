#!/usr/bin/env bash

# SketchyBar Wifi Component
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
  label.max_chars=30
  label.scroll_duration=720
  label.font.style=italic
  script="$PLUGIN_DIR/wifi.sh"
  scroll_texts=on
  updates=on
)
network_properties=(
  icon=󰛳
  label.drawing=off
)

events=(
  wifi_config
  mouse.entered
  system_woke
)

sketchybar --add alias "Stats,Network_network_chart" right \
  --set "Stats,Network_network_chart" "${network_properties[@]}" \
  --add item wifi right \
  --set wifi "${properties[@]}" \
  --subscribe wifi "${events[@]}"
