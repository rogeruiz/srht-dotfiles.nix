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
# en: Parse the JSON variable, `$INFO`, into a bunch of variables of the same name
# with '_info' as a suffix one-time.
#
# NOTE:
# ejemplo / example:
# ```sh
# INFO="{
#   "album": "[<valor_para_album>]",
#   "app": "<nobre_de_app>",
#   "artist": "[<valor_para_artista>]",
#   "state": "<playing|paused>",
#   "title": "[<valor_para_titulo>]"
# }"
# ```

EXTRACTED_VARS="$(
  jq -r --argjson info "$INFO" -n '
    $info |
      to_entries |
      map(["export \(.key + "_info")=\(.value | @sh)"])[][]
  ' 2>/dev/null
)"

if [[ -z $EXTRACTED_VARS ]]; then
  declare -A info=(
    [playbackRate]=''
    [artist]=''
    [title]=''
    [album]=''
    [isMusicApp]=''
  )
  count=0

  INFO=$(/etc/profiles/per-user/yo/bin/nowplaying-cli get playbackRate artist title album isMusicApp | {
    while read -r line; do
      case ${count} in
      0) info[playbackRate]="$line" ;;
      1) info[artist]="$line" ;;
      2) info[title]="$line" ;;
      3) info[album]="$line" ;;
      4) info[isMusicApp]="$line" ;;
      *) ;;
      esac
      count=$((count + 1))
    done

    if [[ "${info[artist]}" == "null" ]]; then
      unset 'info[artist]'
    fi

    if [[ "${info[album]}" == "null" ]]; then
      unset 'info[album]'
    fi

    if [[ "${info[isMusicApp]}" == "null" ]]; then
      unset 'info[isMusicApp]'
    fi

    if [[ "${info[isMusicApp]}" -eq 1 ]]; then
      info[isMusicApp]='Música'
    fi

    if [[ "${info[playbackRate]}" -eq 1 ]]; then
      info[playbackRate]='playing'
    else
      info[playbackRate]='paused'
    fi

    printf "%s|" "${info[@]}"
  })

  state_info=$(printf %s "${INFO}" | cut -d '|' -f 1)
  artist_info=$(printf %s "${INFO}" | cut -d '|' -f 2)
  title_info=$(printf %s "${INFO}" | cut -d '|' -f 3)
  album_info=$(printf %s "${INFO}" | cut -d '|' -f 5)
  app_info=$(printf %s "${INFO}" | cut -d '|' -f 4)

  if [[ "${title_info}" == "null" ]]; then
    unset INFO
  fi

else
  eval "$EXTRACTED_VARS"
fi

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
)

if [[ -z $INFO ]]; then
  sketchybar --set "${NAME:=music}" icon.drawing=off label.drawing=off
else
  sketchybar --set "${NAME:=music}" "${properties[@]}"
fi
