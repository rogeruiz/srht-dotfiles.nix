#!/usr/bin/env bash

# SketchyBar Front Application plugin
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

VARIABLES_DIR="${CONFIG_DIR}/variables"
ICON=$("${VARIABLES_DIR}/app_icons.sh" "${INFO}")
source "${VARIABLES_DIR}/margins.sh"

# if [[ "${ICON}" != "󰣆" ]]; then
#   unset INFO
# fi

sketchybar --set "${NAME}" icon="${ICON}" icon.padding_right="${margins}" label.drawing="off"

if [[ -n "${INFO}" ]]; then
  sketchybar --set "${NAME}" icon.padding_right=0 label="${INFO}" label.drawing="on"
fi
