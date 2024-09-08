#!/bin/bash

properties=(
  icon.drawing=off
  label.max_chars=55
  label.scroll_duration=920
  label.padding_left="${margins}"
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
