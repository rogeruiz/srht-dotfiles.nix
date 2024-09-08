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
      [7-9][0-9]|100) ICON="󰕾";;
      [4-6][0-9]) ICON="󰖀";;
      [1-3][0-9]|[0-9]) ICON="󰕿";;
      # NOT IMPLEMENTED
      *) exit 0 ;;
    esac
  fi
  VOLUME="${VOLUME}%"
fi

sketchybar --set $NAME icon=$ICON \
           --set $NAME label="$VOLUME" \
           --set $NAME icon.highlight="$HIGHLIGHT" \
           --set $NAME label.highlight="$HIGHLIGHT"
