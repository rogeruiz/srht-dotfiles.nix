#!/bin/bash

config=(
  height="${altura}"
  corner_radius=12
  margin="${gaps}"
  y_offset=$((bar_yoffset))
  padding_left="${margins}"
  padding_right="${margins}"
)

sketchybar --bar "${config[@]}"
