# Custom Catppuccin Tmux Ventana configuration
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

# es: Esta parte de la configuración añadia un nuevo módulo pa' mostrar el
# nombre de la ventana de Tmux
# en: This part of the configuration adds a new module to show the Tmux window
# name.

{ pkgs, ... }:
let
  utils = import ../../utils { inherit pkgs; };
in
pkgs.writeTextFile {
  name = "catppuccin-ventana-config";
  # tmux
  text = ''
    set -g @catppuccin_ventana_icon "   "
    set -g @catppuccin_status_ventana_icon_fg "#{E:@thm_crust}"
    set -g @catppuccin_status_ventana_text_fg "#{E:@thm_fg}"
    set -g @catppuccin_ventana_color "#{E:@thm_yellow}"
    set -g @catppuccin_ventana_text " #W"

    %hidden MODULE_NAME="ventana"
    # shellcheck disable=SC1091
    source "${utils.status-module-path}"
  '';
  destination = "/share/ventana.config";

}
