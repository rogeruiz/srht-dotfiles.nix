#!/bin/zsh

# Usando el ejecutable privado de Apple, vamos a coger la información de el
# WiFi de la computadora
CURRENT_WIFI="$(
  /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
)"

# Luego vamos a coger el SSID de la información usando `ripgrep`.
SSID="$(
  echo "$CURRENT_WIFI" | \
  rg -o "SSID: .*" | \
  sed 's/^SSID: //'
)"

# Y otro paso más, vamos a coger la tasa de transmisión del WiFi tambien usando
# `ripgrep`.
CURR_TX="$(
  echo "$CURRENT_WIFI" |
  rg -o "lastTxRate: .*" | \
  sed 's/^lastTxRate: //'
)"
MAX_TX="$(
  echo "$CURRENT_WIFI" |
  rg -o "maxRate: .*" | \
  sed 's/^maxRate: //'
)"


# Y al final porque la tasa esta escrita en Megabits la vamos a convertir en
# Gigabits porque me gusta mejor así. Yo consumo mucho Internet entonces me
# gusta ver un número más preciso.
# @desempeño 0.012 segundos
CURR_CALC=$(
  echo "scale=2; $CURR_TX / $MAX_TX * 100" | bc | cut -d '.' -f 1
)

# Si la calculación no se aplicar correctamente, se defina la fuerza ha ciento
# porcento pa' que salge algo en la barrilla.
CURR_FUERZA="󰤩"

# Calculemos el porcentaje de la señal usand el TX max y el TX currente.
# Empezemos de cero
if (( 0 <= $CURR_CALC && $CURR_CALC <= 20))
then
  CURR_FUERZA="󰤯"
elif (( 21 <= $CURR_CALC && $CURR_CALC <= 40))
then
  CURR_FUERZA="󰤟"
elif (( 41 <= $CURR_CALC && $CURR_CALC <= 60))
then
  CURR_FUERZA="󰤢"
elif (( 61 <= $CURR_CALC && $CURR_CALC <= 80))
then
  CURR_FUERZA="󰤥"
elif (( 81 <= $CURR_CALC && $CURR_CALC <= 100))
then
  CURR_FUERZA="󰤨"
fi

if [[ -z "$SSID" ]]; then
  sketchybar --set $NAME label.drawing=off icon.padding_right=10 icon="󰖪"
else
  sketchybar --set $NAME label.drawing=on label="$SSID ${CURR_FUERZA}" icon.padding_right=0 icon=󰖩
fi
