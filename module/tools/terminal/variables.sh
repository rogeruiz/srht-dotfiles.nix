# Shell variables
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

# vi: ft=sh

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

export PATH="/Users/yo/.local/bin:$PATH"


# NOTE: Opciones de configuración de tema para la herramienta `nnn`.
# fuente: https://github.com/catppuccin/catppuccin/discussions/1955
#  ███▄    █  ███▄    █  ███▄    █
#  ██ ▀█   █  ██ ▀█   █  ██ ▀█   █
# ▓██  ▀█ ██▒▓██  ▀█ ██▒▓██  ▀█ ██▒
# ▓██▒  ▐▌██▒▓██▒  ▐▌██▒▓██▒  ▐▌██▒
# ▒██░   ▓██░▒██░   ▓██░▒██░   ▓██░
# ░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒
# ░ ░░   ░ ▒░░ ░░   ░ ▒░░ ░░   ░ ▒░
#    ░   ░ ░    ░   ░ ░    ░   ░ ░
#          ░          ░          ░

# Relies on you're terminal using the catppuccin theme and will use true Catppuccin colors:
BLK="03" CHR="03" DIR="04" EXE="02" REG="07" HARDLINK="05" SYMLINK="05" MISSING="08" ORPHAN="01" FIFO="06" SOCK="03" UNKNOWN="01"

# Export Context Colors
export NNN_COLORS="#04020301;4231"

# Finally Export the set file colors ( Both options require this)
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$UNKNOWN"
