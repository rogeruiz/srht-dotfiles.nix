#!/usr/bin/env bash

# SketchyBar Music component
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

properties=(
  display=1
  label.max_chars=45
  label.scroll_duration=720
  script="$PLUGIN_DIR/now-playing.sh"
  scroll_texts=on
  updates=on
  background.border_width=1
)
events=(
  media_change
  music_change
  spotify_change
  mouse.exited
)

sketchbar --add event \
  music_change "com.apple.Music.playerInfo" \
  spotify_change "com.spotify.client.PlaybackStateChanged"

sketchybar --add item music center \
  --set music "${properties[@]}" \
  --subscribe music "${events[@]}"
