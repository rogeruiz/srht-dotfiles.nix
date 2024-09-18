#!/usr/bin/env bash

SSID="$(
  networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //"
)"

SIN_CONEXION="You are not associated with an AirPort network."
SIN_PODER="Wi-Fi power is currently off."
ICONO='󰖩'
CELULAR=""
CASA="󰴖"
ETIQUETA_ERROR=""

if [[ $SSID =~ $SIN_CONEXION ]]; then
  ICONO="󱚵"
  SSID="${SSID//${SIN_CONEXION}/}"
  ETIQUETA_ERROR="No hay conexión de Wi-Fi"
fi

if [[ $SSID =~ $SIN_PODER ]]; then
  ICONO="󰖪"
  SSID="${SSID//${SIN_PODER}/}"
  ETIQUETA_ERROR="Wi-Fi esta apagado"
fi

# NOTE: Esto se requiere porque la manera que remplazo el texto de $SSID no le
# para bolas a los caracteres de `\t`, `\r`, ni `\n'. Entonces uso esto para
# quitar esos caracteres del $SSID porque no se necesitan.
SSID="${SSID//[$'\t\r\n']/}"

case "${SSID}" in
"tell my wifi love her") ICONO+=" ${CASA}" ;;
"razor 13" | *iPhone) ICONO+=" ${CELULAR}" ;;
*) ;;
esac

if [[ -z "$SSID" && "${SSID}xyz" = "xyz" && -n $ETIQUETA_ERROR ]]; then
  sketchybar --set "${NAME:=wifi}" label.drawing=on icon="${ICONO}" label="${ETIQUETA_ERROR}"
else
  sketchybar --set "${NAME:=wifi}" label.drawing=on label="$SSID" icon="${ICONO}"
fi
