#!/bin/bash

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  osascript -e 'set volume input volume 25'
  sketchybar --set mic icon= icon.highlight=true
elif [[ $MIC_VOLUME -gt 0 ]]; then
  osascript -e 'set volume input volume 0'
  sketchybar --set mic icon= icon.highlight=true
fi
