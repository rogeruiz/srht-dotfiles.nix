#!/usr/bin/env bash
#
# SketchyBar Sound plugin
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

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")
HIGHLIGHT="false"

if [[ $VOLUME == "missing value" ]]; then
  ICON="󰡁 "
  VOLUME="  "
else
  if [[ $MUTED != "false" ]]; then
    ICON="󰝟"
    HIGHLIGHT="true"
  else
    case ${VOLUME} in
    [7-9][0-9] | 100) ICON="󰕾" ;;
    [4-6][0-9]) ICON="󰖀" ;;
    [1-3][0-9] | [0-9]) ICON="󰕿" ;;
    # NOT IMPLEMENTED
    *) exit 0 ;;
    esac
  fi
  VOLUME="${VOLUME}%"
fi

sketchybar --set $NAME icon=$ICON \
  --set $NAME label="$VOLUME" \
  --set $NAME icon.highlight="$HIGHLIGHT" \
  --set $NAME label.highlight="$HIGHLIGHT"
