#!/bin/zsh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

meses_del_ano=("enero" "febrero" "marzo" "abril" "mayo" "junio" "julio" "agosto" "septiembre" "octubre" "noviembre" "diciembre")

meses_del_ano_corto=("enero" "feb." "marzo" "abr." "mayo" "jun." "jul." "agosto" "set." "oct." "nov." "dic.")

# sketchybar --set $NAME label="$(date "+%d ${meses_del_ano_corto[$(date "+%m")]} '%y %H:%M:%S")"
sketchybar --set $NAME label="$(date "+%y/%m/%d %H:%M")"
