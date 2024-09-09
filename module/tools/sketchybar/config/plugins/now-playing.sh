#!/usr/bin/env bash

VARIABLES_DIR="${CONFIG_DIR}/variables"
ICON=''
LABEL=''

# Parse the $INFO into a bunch of variables of the same name
eval "$(
  jq -r --argjson info "$INFO" -n '$info | to_entries | map(["export \(.key + "_info")=\(.value | @sh)"])[][]'
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
)

sketchybar --set "${NAME:=music}" "${properties[@]}"
