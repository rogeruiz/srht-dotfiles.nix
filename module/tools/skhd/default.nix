{ pkgs, ... }:

# Nix Darwin SKHD module
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

let
  margins = "12";
  sketchybar = "${pkgs.sketchybar}/bin/sketchybar";
  yabai = "${pkgs.yabai}/bin/yabai";
in
{
  services.skhd = {
    enable = true;
    skhdConfig =
      # ini
      ''
        # Navegación
        alt - h : ${yabai} -m window --focus west
        alt - j : ${yabai} -m window --focus south
        alt - k : ${yabai} -m window --focus north
        alt - l : ${yabai} -m window --focus east

        # Moviendo ventanas
        shift + alt - h : ${yabai} -m window --warp west
        shift + alt - j : ${yabai} -m window --warp south
        shift + alt - k : ${yabai} -m window --warp north
        shift + alt - l : ${yabai} -m window --warp east

        shift + alt - 0x1D : ${yabai} -m window --opacity 1.0
        shift + alt - 0x1B : ${yabai} -m window --opacity 0.25
        shift + alt - 0x18 : ${yabai} -m window --opacity 0.7

        # Cambiar el tamaño de las ventanas
        lctrl + alt - h : ${yabai} -m window --resize left:-${margins}:0; ${yabai} -m window --resize right:-${margins}:0
        lctrl + alt - j : ${yabai} -m window --resize bottom:0:${margins}; ${yabai} -m window --resize top:0:${margins}
        lctrl + alt - k : ${yabai} -m window --resize top:0:-${margins}; ${yabai} -m window --resize bottom:0:-${margins}
        lctrl + alt - l : ${yabai} -m window --resize right:${margins}:0; ${yabai} -m window --resize left:${margins}:0

        # Moviendo el foco de el espacio de trabajo
        shift + alt - m : ${yabai} -m window --space last; ${yabai} -m space --focus last
        shift + alt - p : ${yabai} -m window --space prev; ${yabai} -m space --focus prev
        shift + alt - n : ${yabai} -m window --space next; ${yabai} -m space --focus next

        # Flotar o sin flotar la ventana
        shift + alt - space : \
          ${yabai} -m window --toggle float; \
          ${yabai} -m window --toggle border

        # Reiniciar Sketchybar y Yabai juntos
        alt + shift - r : ${sketchybar} --reload; launchctl kill 3 gui/501/org.nixos.yabai

        alt + shift - 0x2B : \
          /usr/bin/osascript -e \
          'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode';
      '';
  };
}
