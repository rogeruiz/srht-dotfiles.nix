#!/bin/bash

properties=(
  display=1
  label.max_chars=55
  label.scroll_duration=920
  script="$PLUGIN_DIR/now-playing.sh"
  scroll_texts=on
  updates=when_shown
)
events=(
  media_change
)

sketchybar --add item music center \
  --set music "${properties[@]}" \
  --subscribe music "${events[@]}"
