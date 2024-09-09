#!/bin/bash

config=(
  background.height="${altura}"
  drawing=on
  icon.font="RecMonoCasual Nerd Font:Regular:15"
  icon.padding_left="${margins}"
  label.font="RecMonoCasual Nerd Font:Regular:15"
  icon.padding_right=$((margins / 2))
  label.padding_left=$((margins / 2))
  label.padding_right="${margins}"
  updates=when_shown
)

sketchybar --default "${config[@]}"
