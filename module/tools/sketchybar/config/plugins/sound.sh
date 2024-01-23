#!/bin/zsh

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")
HIGHLIGHT="false"

if [[ $VOLUME == "missing value" ]]
then
  ICON="󰡁 "
  VOLUME="  "
else
  if [[ $MUTED != "false" ]]; then
    ICON="󰝟"
    HIGHLIGHT="true"
  else
    case ${VOLUME} in
      100) ICON="󰕾";;
      9[0-9]) ICON="󰕾";;
      8[0-9]) ICON="󰕾";;
      7[0-9]) ICON="󰕾";;
      6[0-9]) ICON="󰖀";;
      5[0-9]) ICON="󰖀";;
      4[0-9]) ICON="󰖀";;
      3[0-9]) ICON="󰕿";;
      2[0-9]) ICON="󰕿";;
      1[0-9]) ICON="󰕿";;
      [0-9]) ICON="󰕿";;
      *) ICON="󰕿"
    esac
  fi
  VOLUME="${VOLUME}%"
fi

sketchybar --set $NAME icon=$ICON \
           --set $NAME label="$VOLUME" \
           --set $NAME icon.highlight="$HIGHLIGHT" \
           --set $NAME label.highlight="$HIGHLIGHT"
