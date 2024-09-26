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
  margins = "6";
  sketchybarBin = "${pkgs.sketchybar}/bin/sketchybar";
  yabaiBin = "${pkgs.yabai}/bin/yabai";
in
{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # Navegación
      alt - h : ${yabaiBin} -m window --focus west
      alt - j : ${yabaiBin} -m window --focus south
      alt - k : ${yabaiBin} -m window --focus north
      alt - l : ${yabaiBin} -m window --focus east

      # Moviendo ventanas
      shift + alt - h : ${yabaiBin} -m window --warp west
      shift + alt - j : ${yabaiBin} -m window --warp south
      shift + alt - k : ${yabaiBin} -m window --warp north
      shift + alt - l : ${yabaiBin} -m window --warp east

      # Cambiar el tamaño de las ventanas
      lctrl + alt - h : ${yabaiBin} -m window --resize left:-${margins}:0; \
                        ${yabaiBin} -m window --resize right:-${margins}:0
      lctrl + alt - j : ${yabaiBin} -m window --resize bottom:0:${margins}; \
                        ${yabaiBin} -m window --resize top:0:${margins}
      lctrl + alt - k : ${yabaiBin} -m window --resize top:0:-${margins}; \
                        ${yabaiBin} -m window --resize bottom:0:-${margins}
      lctrl + alt - l : ${yabaiBin} -m window --resize right:${margins}:0; \
                        ${yabaiBin} -m window --resize left:${margins}:0

      # Moviendo el foco de el espacio de trabajo
      shift + alt - m : ${yabaiBin} -m window --space last; yabai -m space --focus last
      shift + alt - p : ${yabaiBin} -m window --space prev; yabai -m space --focus prev
      shift + alt - n : ${yabaiBin} -m window --space next; yabai -m space --focus next

      # Flotar o sin flotar la ventana
      shift + alt - space : \
          ${yabaiBin} -m window --toggle float; \
          ${yabaiBin} -m window --toggle border

      fn + shift - r : ${sketchybarBin} --reload

      fn + shift - 0x2B : /usr/bin/osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
    '';
  };
}
