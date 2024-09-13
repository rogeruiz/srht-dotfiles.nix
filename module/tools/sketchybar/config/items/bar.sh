#!/bin/bash

config=(
  height="${altura}"
  corner_radius=12
  margin="${gaps}"
  y_offset=$((bar_yoffset))
  padding_left="${margins}"
  padding_right="${margins}"
  background.border_width=1
)

sketchybar --bar "${config[@]}"
