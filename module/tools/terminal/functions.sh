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
# ejemplo: `limpia-git origin` o `limpia-git upstream` para cambiar el origen.
limpia-git() {
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
# ejemplo: `colores-git origin` o `colorest-git upstream`
colores-git() {
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
