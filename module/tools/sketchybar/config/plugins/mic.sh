#!/bin/zsh

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  sketchybar --set mic icon= icon.highlight=false
elif [[ $MIC_VOLUME -gt 0 ]]; then
  sketchybar --set mic icon= icon.highlight=true
fi
