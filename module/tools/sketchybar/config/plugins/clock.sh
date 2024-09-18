#!/usr/bin/env bash

# SketchyBar Clock plugin
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

dias_de_la_semana=(
  "domingo"
  "lunes"
  "martes"
  "miércoles"
  "jueves"
  "viernes"
  "sábado"
)

dias_de_la_semana_abreviados=(
  "do."
  "lu."
  "ma."
  "mi."
  "ju."
  "vi."
  "sá."
)

meses_del_ano=(
  "enero"
  "febrero"
  "marzo"
  "abril"
  "mayo"
  "junio"
  "julio"
  "agosto"
  "septiembre"
  "octubre"
  "noviembre"
  "diciembre"
)

meses_del_ano_abreviados=(
  "en."
  "feb."
  "mzo."
  "abr."
  "my."
  "jun."
  "jul."
  "ag."
  "sept."
  "oct."
  "nov."
  "dic."
)

# PERF: Se tiene que aumentar el numero reportado por `date` pa' el dia de la
# semana porque los Arrays de Bash empiezan con 1 y no con 0.
dia_num=$(date "+%w")
dia_num=$((dia_num + 1))

# dia="${dias_de_la_semana[${dia_num}]}"
# mes="${meses_del_ano[$(date "+%m")]}"
dia="${dias_de_la_semana_abreviados[${dia_num}]}"
mes="${meses_del_ano_abreviados[$(date "+%m")]}"

sketchybar --set $NAME label="$(date "+${dia} %d ${mes} '%y %H:%M:%S")"
# sketchybar --set $NAME label="$(date "+%y/%m/%d %H:%M:%S")"
