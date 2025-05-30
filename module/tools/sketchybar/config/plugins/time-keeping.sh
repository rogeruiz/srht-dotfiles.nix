#!/usr/bin/env bash

# SketchyBar Tick plugin
# Copyright (C) 2025 Roger Steve Ruiz
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

LABEL="$(
  tick -v status |
    rg -e "\( (\d{2}:\d{2}:\d{2}) \)" -e "\[ ([a-zA-Z\-áéíóúüñÁÉÍÓÚÜÑ]+) \]" -r '$1$2' -o |
    xargs echo
)"

properties=(
  icon.drawing=on
  label.drawing=on
  icon="󱫤"
  label="${LABEL}"
)

if [[ -z "$LABEL" ]]; then
  sketchybar --set time_keeping label.drawing=off icon.drawing=off
else
  sketchybar --set time_keeping "${properties[@]}"
fi
