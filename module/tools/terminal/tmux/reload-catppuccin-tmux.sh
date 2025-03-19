# Reload Catppuccin Tmux from shell using pkgs.writeShellApplication
# Copyright (C) 2025 Roger Steve Ruiz
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

if [[ "$TMUX" != "" ]]; then
  if defaults read -g AppleInterfaceStyle &>/dev/null; then
    FLAVOR="mocha"
  else
    FLAVOR="latte"
  fi

  tmux set -g @catppuccin_flavor "${FLAVOR}"
  tmux set -g @catppuccin_reset "true"
  # shellcheck disable=SC2154
  tmux run -d 1 "${catppuccin_tmux_path_from_nix_store}"

  # shellcheck disable=SC2154,1090
  tmux source "${catppuccin_config}"
  tmux set -g @catppuccin_flavor "${FLAVOR}"
  # shellcheck disable=SC2154
  tmux run -d 1 "${catppuccin_tmux_path_from_nix_store}"

  # shellcheck disable=SC2154,1090
  tmux source "${catppuccin_after_config}"
fi
