#!/usr/bin/env bash

# SketchyBar Now Playing plugin
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
ICON=''
LABEL=''

# PERF:
# Analizar el variable de JSON, `$INFO`, en un montón de variables con el mismo
# nombre con '_info' como un sufijo una vez.
# Parse the JSON variable, `$INFO`, into a bunch of variables of the same name
# with '_info' as a suffix one-time.
#
# NOTE:
# ejemplo / example:
# ```sh
# INFO="{
#   "album": "[<valor_para_album>]"
#   "app": "<nobre_de_app>"
#   "artist": "[<valor_para_artista>]"
#   "state": "<playing|paused>",
#   "title": "[<valor_para_titulo>]"
# }"
# ```
eval "$(
  jq -r --argjson info "$INFO" -n '
    $info |
      to_entries |
      map(["export \(.key + "_info")=\(.value | @sh)"])[][]
  '
)"

if [[ -n "${state_info}" ]]; then
  case "${state_info}" in
  'playing') ICON+=" " ;;
  'paused') ICON+=" " ;;
  *) ;;
  esac
fi

if [[ -n "${app_info}" ]]; then
  ICON+=$("${VARIABLES_DIR}/app_icons.sh" "${app_info}")
fi

if [[ -n "${artist_info}" ]]; then
  LABEL+="${artist_info} / "
fi

if [[ -n "${title_info}" ]]; then
  LABEL+="${title_info}"
fi

if [[ -n "${album_info}" ]]; then
  LABEL+=" / ${album_info}"
fi

properties=(
  icon="${ICON}"
  label="${LABEL}"
  icon.drawing=on
  label.drawing=on
  drawing=on
)

if [[ -z $INFO ]]; then
  sketchybar --set "${NAME:=music}" drawing=off icon.drawing=off label.drawing=off
else
  sketchybar --set "${NAME:=music}" "${properties[@]}"
fi
