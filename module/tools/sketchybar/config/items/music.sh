#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

properties=(
  # background.border_width=3
  # background.corner_radius=3
  background.padding_left=0
  background.padding_right=0
  icon.drawing=off
  label.max_chars=55
  label.padding_left=10
  label.padding_right=10
  label.scroll_duration=920
  script="$PLUGIN_DIR/music.sh"
  scroll_texts=on
  display=1
)
events=(
  mouse.clicked
  system_woke
  music_change
  spotify_change
)

sketchybar --add event \
  music_change "com.apple.Music.playerInfo" \
  spotify_change "com.spotify.client.PlaybackStateChanged"

sketchybar --add item music center \
  --set music "${properties[@]}" \
  --subscribe music "${events[@]}"
