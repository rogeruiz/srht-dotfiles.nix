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
# _reload-vars es una función pa' facilitar los cambios de los variables de mi
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
# _recarga_funcs es una función pa' facilitar los cambios de las funciones de
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
