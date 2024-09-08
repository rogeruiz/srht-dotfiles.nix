#!/bin/bash

config=(
  drawing=off
  script="$PLUGIN_DIR/set_theme.sh"
  updates=on
)
events=(
  theme_changed
)

sketchybar --add event \
  theme_changed AppleInterfaceThemeChangedNotification

sketchybar --add item theme center \
  --set theme "${config[@]}" \
  --subscribe theme "${events[@]}"
