#!/usr/bin/env bash

# SketchyBar Battery plugin
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

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $PERCENTAGE = "" ]]; then
  exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
  ICON=""
  ICON_COLOR="0xff40a02b"
  ;;
[6-8][0-9])
  ICON=""
  ICON_COLOR="0xff179299"
  ;;
[3-5][0-9])
  ICON=""
  ICON_COLOR="0xfffe640b"
  ;;
[1-2][0-9])
  ICON=""
  ICON_COLOR="0xffdf8e1d"
  ;;
*)
  ICON=""
  ICON_COLOR="0xffd20f39"
  ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON=""
  ICON_COLOR="0xffdf8e1d"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME \
  icon="$ICON" \
  icon.color="$ICON_COLOR" \
  label="${PERCENTAGE}%"
