#!/usr/bin/env bash

# SketchyBar Wi-Fi plugin
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

SSID="$(
system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1;print $0 | "tr -d ':'";exit}'
)"

SIN_CONEXION="You are not associated with an AirPort network."
ICONO='󰖩'
CELULAR=""
CASA="󰴖"
CAFE=""
HOTEL=""
ETIQUETA_ERROR=""

if [[ -z $SSID ]]; then
  ICONO="󱚵"
  SSID="${SSID//${SIN_CONEXION}/}"
  ETIQUETA_ERROR="No hay conexión de Wi-Fi"
fi

# NOTE: Esto se requiere porque la manera que remplazo el texto de $SSID no le
# para bolas a los caracteres de `\t`, `\r`, ni `\n'. Entonces uso esto para
# quitar esos caracteres del $SSID porque no se necesitan.
SSID="${SSID//[$'\t\r\n']/}"

case "${SSID}" in
"tell my wifi love her"*) ICONO+=" ${CASA}" ;;
"OverflowCHI" | "SocialeCafePress_IoT" | "Hexecoffee") ICONO+=" ${CAFE}" ;;
"razor "* | *iPhone) ICONO+=" ${CELULAR}" ;;
"Hilton Honors") ICONO+=" ${HOTEL}" ;;
*) ;;
esac

if [[ -z "$SSID" && "${SSID}xyz" = "xyz" && -n $ETIQUETA_ERROR ]]; then
  sketchybar --set "${NAME:=wifi}" label.drawing=on icon="${ICONO}" label="${ETIQUETA_ERROR}"
else
  sketchybar --set "${NAME:=wifi}" label.drawing=on label="$SSID" icon="${ICONO}"
fi
