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

tipo="CORTO" # o `LARGO`

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

# PERF: Aseguremos que los numeros de'l comando `date` son numeros usando
# `$((..))` pa' convertir numeros con ceros delanteros en numeros sin ceros a
# la izquierda. Por ejemplo: Estos dos numeros no son iguales por el cero, 1 !=
# 01, entonces lo cambio a un numero como 1 pa' que 1 == 1.
#
# INFO: Los numeros de los dias de la semana tienen rango de 0-7. Los numeros
# de el mes tienen rango de 01-12.

num_semana=$((10#$(date +%w) + 0))
num_mes=$((10#$(date +%m) - 1))

if [ "${tipo}" == "CORTO" ]; then
  dia="${dias_de_la_semana_abreviados[${num_semana}]}"
  mes="${meses_del_ano_abreviados[${num_mes}]}"
elif [ "LARGO" == "${tipo}" ]; then
  dia="${dias_de_la_semana[${num_semana}]}"
  mes="${meses_del_ano[${num_mes}]}"
fi

sketchybar --set "${NAME:=clock}" label="$(date "+${dia} %d ${mes} '%y %H:%M:%S")"
