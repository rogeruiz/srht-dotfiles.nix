#!/bin/zsh

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

# dia="${dias_de_la_semana[$(date "+%w")]}"
# mes="${meses_del_ano[$(date "+%m")]}"
dia="${dias_de_la_semana_abreviados[$(date "+%w")]}"
mes="${meses_del_ano_abreviados[$(date "+%m")]}"

sketchybar --set $NAME label="$(date "+${dia} %d ${mes} '%y %H:%M:%S")"
# sketchybar --set $NAME label="$(date "+%y/%m/%d %H:%M:%S")"
