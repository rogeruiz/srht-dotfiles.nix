#!/bin/zsh

DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -r '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headphones") | keys[]')

APPLE_LOGO=""
BT_LOGO="󰂯"

if [[ -z "$DEVICES" ]]
then
  sketchybar --set $NAME icon.drawing=off label.drawing=off
else
  if [[ "${DEVICES}" == "Scissors Pro" || "${DEVICES}" == "tijeras studio pro" ]]
  then
    DEVICES=$APPLE_LOGO
  else
    DEVICES=$BT_LOGO
  fi
  sketchybar --set $NAME icon.drawing=on label.drawing=on label="$DEVICES"
fi
