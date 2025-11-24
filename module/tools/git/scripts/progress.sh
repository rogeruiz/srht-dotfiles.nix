# shellcheck disable=SC2016
printf 'Comparando `%s`:\n' "$1"
# printf 'Comparing `%s`:\n' "$1"

read -r -d '' tmpl_es <<TMPL
\t🔙  detrás: %s compromiso(s)
\t🔜 delante: %s compromiso(s)\n
TMPL

# shellcheck disable=SC2034
read -r -d '' tmpl_en <<TMPL
\t🔙 behind: %s commit(s)
\t🔜  ahead: %s commit(s)\n
TMPL

git rev-list \
  --left-right \
  --count "$1" |
  xargs printf "$tmpl_es"
