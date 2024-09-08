#!/bin/bash

config=(
  height="${altura}"
  corner_radius=12
  margin="${margins}"
  y_offset=$((bar_yoffset))
  padding_left=10
  padding_right=10
)

sketchybar --bar "${config[@]}"
