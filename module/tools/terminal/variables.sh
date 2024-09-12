LS_COLORS=$(/etc/profiles/per-user/yo/bin/vivid generate catppuccin-mocha)

export LS_COLORS

# Para que los comandos de `gh` se vean bien. Un valor de "" es para modos Dark
# y un valor de "1;15" es para modos Light
# So that commands in `gh` output colors correctly. A value of "" is for Dark
# and a value of "1;15" is for Light modes.
export COLORFGBG=""

# Estos variables los jale de `locale -a`.
# These variables I pulled from `locale -a`
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
# LANG=es_ES.UTF-8
# LC_ALL=es_ES.UTF-8
