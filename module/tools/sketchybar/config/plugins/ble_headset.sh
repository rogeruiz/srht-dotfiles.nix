#!/usr/bin/env bash

# SketchyBar Bluetooth Headset plugin
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

DEVICES=$(
  system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null |
    jq -r '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headphones") | keys[]'
)

APPLE_LOGO=""
BT_LOGO="󰂯"

if [[ -z "$DEVICES" ]]; then
  sketchybar --set "${NAME}" drawing=off
else
  case "${DEVICES}" in
  "Scissors" | "Scissors Pro" | "tijeras studio pro" | "Powerbeats Pro de Roger" | "tijeras Powerbeats Pro")
    DEVICES=$APPLE_LOGO
    ;;
  *)
    DEVICES=$BT_LOGO
    ;;
  esac
  sketchybar --set "${NAME:=headphones}" drawing=on label="$DEVICES"
fi
