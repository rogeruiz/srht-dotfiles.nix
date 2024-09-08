#!/bin/bash

config=(
  updates=when_shown
  drawing=on
  background.height="${altura}"
  icon.font="RecMonoCasual Nerd Font:Regular:13"
  icon.padding_left=4
  icon.padding_right=4
  label.font="RecMonoCasual Nerd Font:Regular:13"
  label.padding_left=4
  label.padding_right=4
)

sketchybar --default "${config[@]}"
