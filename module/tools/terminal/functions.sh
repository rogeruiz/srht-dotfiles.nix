# Shell functions
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

#  __    _           _                                   _
# |  |  |_|_____ ___|_|___    ___ ___ _____ ___ ___    _| |___
# |  |__| |     | . | | .'|  |  _| .'|     | .'|_ -|  | . | -_|
# |_____|_|_|_|_|  _|_|__,|  |_| |__,|_|_|_|__,|___|  |___|___|
#               |_|
#  _____ _ _
# |   __|_| |_
# |  |  | |  _|
# |_____|_|_|
#
# limpia-git es una función que limpia las ramas de Git que ya estan unidas en
# la rama defecto del repositorio.
# NOTE:
# ejemplo: `,limpia-git origin` o `,limpia-git upstream` para cambiar el origen.
,limpia-git() {
  local remote_name="${1:-origin}"
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    git remote prune "${remote_name}"

    git branch -r |
      awk '{print $1}' |
      grep -E -v -f /dev/fd/0 <(git branch -vv | rg "${remote_name}") |
      awk '{print $1}' |
      xargs git branch -D
  else
    echo "There's not \".git/\" directory in \"$(pwd)\"."
  fi
}

#  _____     _                      _
# |     |___| |___ ___ ___ ___    _| |___
# |   --| . | | . |  _| -_|_ -|  | . | -_|
# |_____|___|_|___|_| |___|___|  |___|___|
#                      _ _                     _____ _ _
#  ___ ___ _____ _____|_| |_ ___    ___ ___   |   __|_| |_
# |  _| . |     |     | |  _|_ -|  | -_|   |  |  |  | |  _|
# |___|___|_|_|_|_|_|_|_|_| |___|  |___|_|_|  |_____|_|_|
#
# colores-git es una función que consulta los varios commits en la rama de Git
# y los compara con los commits de la rama defecto y por cada SHA-256 corre la
# aplicación `commit-colors` para producer un color usando HEX con el SHA-256
# d'el corriente commit.
# NOTE:
# ejemplo: `,colores-git origin` o `colorest-git upstream`
,colores-git() {
  remote_name="${1:-origin}"
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local default_branch
    default_branch=$(git remote show "${remote_name}" | rg 'HEAD branch' | choose 2)
    for sha in $(git rev-list "${remote_name}/${default_branch}...$(git wtb)"); do
      echo -n "$(commit-colors "${sha}" | sed -n '2p')"
    done
    echo
  fi
}

#
#  _____                               _
# | __  |___ ___ ___ ___ ___ ___ ___ _| |___
# |    -| -_|  _| .'|  _| . | .'|   | . | . |
# |__|__|___|___|__,|_| |_  |__,|_|_|___|___|
#                       |___|
#                                             _
#              _     _   _                   | |       _
#  _ _ ___ ___|_|___| |_| |___ ___    ___ ___|_|   ___| |
# | | | .'|  _| | .'| . | | -_|_ -|  | . | .'|    | -_| |
#  \_/|__,|_| |_|__,|___|_|___|___|  |  _|__,|    |___|_|
#                                    |_|
#  _____ _       _ _
# |   __| |_ ___| | |
# |__   |   | -_| | |
# |_____|_|_|___|_|_|
# reload-vars es una función pa' facilitar los cambios de los variables de mi
# Shell
# NOTE:
# ejemplo: `,recarga-vars`
,recarga-vars() {
  local path=$HOME/.local/share/rstrz/.variables
  local msg="Sourcing ${path}"
  printf "🔃 %s\n" "${msg}"
  # shellcheck source=/Users/yo/.local/share/rstrz/.variables
  source "${path}"
}

#  _____                               _
# | __  |___ ___ ___ ___ ___ ___ ___ _| |___
# |    -| -_|  _| .'|  _| . | .'|   | . | . |
# |__|__|___|___|__,|_| |_  |__,|_|_|___|___|
#                       |___|
#                                               _
#  ___             _                           | |       _
# |  _|_ _ ___ ___|_|___ ___ ___ ___    ___ ___|_|   ___| |
# |  _| | |   |  _| | . |   | -_|_ -|  | . | .'|    | -_| |
# |_| |___|_|_|___|_|___|_|_|___|___|  |  _|__,|    |___|_|
#                                      |_|
#  _____ _       _ _
# |   __| |_ ___| | |
# |__   |   | -_| | |
# |_____|_|_|___|_|_|
#
# recarga_funcs es una función pa' facilitar los cambios de las funciones de
# mi Shell
# NOTE:
# ejemplo: `,recarga-funcs`
,recarga-funcs() {
  local path=$HOME/.local/share/rstrz/.functions
  local msg="Sourcing ${path}"
  printf "🔃 %s\n" "${msg}"
  # shellcheck source=/Users/yo/.local/share/rstrz/.functions
  source "${path}"
}

#  _____                       _        _
# | __  |___ ___ ___ ___ ___ _| |___   | |___ ___
# | __ -| . |  _|  _| .'|   | . | . |  | | . |_ -|
# |_____|___|_| |_| |__,|_|_|___|___|  |_|___|___|
#
#              _   _                  _
#  ___ ___ ___| |_|_|_ _ ___ ___    _| |___
# | .'|  _|  _|   | | | | . |_ -|  | . | -_|
# |__,|_| |___|_|_|_|\_/|___|___|  |___|___|
#
#    ____  _____       _____ _
#   |    \|   __|     |   __| |_ ___ ___ ___
#  _|  |  |__   |     |__   |  _| . |  _| -_|
# |_|____/|_____|_____|_____|_| |___|_| |___|
#               |_____|
# borrar-ds-store es una función pa' borrar los archivos de .DS_Store en un
# directorio y todo los directorios debajo de manera recursiva
# NOTE:
# ejemplo: `,borrar-ds-store`
,borrar-ds-store() {
  if type -p fd >/dev/null 2>&1; then
    printf '➕ Attempting to find & remove .DS_Store files all the way down\n'
    fd --hidden --no-ignore DS_Store --exec-batch rm -rvf
  else
    printf '❌ `fd` not found!\n'
  fi
}
