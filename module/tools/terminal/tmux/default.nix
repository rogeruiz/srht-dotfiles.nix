# Home Manager Nix module for Tmux
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

{ pkgs, lib, ... }:

let

  utils = import ./catppuccin/utils { inherit pkgs; };

  catppuccin = utils.catppuccin { local = true; };
  reload-catppuccin-tmux = import ./catppuccin/bin { inherit pkgs lib; };
  continuum = utils.plugin-path-within-nix-store pkgs.tmuxPlugins.continuum;
  ventana = import ./catppuccin/modules/ventana { inherit pkgs; };
in
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = builtins.readFile ./plugins/resurrect.config;
      }
    ];
    mouse = true;
    shell = "/etc/profiles/per-user/yo/bin/zsh";
    shortcut = "b";
    terminal = "xterm-ghostty";
    clock24 = true;
    tmuxp.enable = true;
    escapeTime = 0;
    extraConfig = lib.concatLines [
      # tmux
      ''
        # Cargando a Continuum manualmente pa poder usar el variable
        # `continuum` en ambos partes de mi configuración.
        ${builtins.readFile ./plugins/continuum.config}
        run ${continuum}
      ''
      # tmux
      ''
        # Cargando a Catppuccin Tmux manualmente pa poder ser capaze de
        # desarollar y también usar el versión de GitHub.
        ${builtins.readFile ./catppuccin/config/before.config}
        source "${ventana}/share/ventana.config"
        run ${catppuccin}
      ''
      # tmux
      ''
        # TODO:
        # es: Esto se puede usar cuando los cambios de catppuccin/tmux y
        # tmux/tmux se alineen.
        # en: This can be used when changes from catppuccin/tmux & tmux/tmux
        # align.
        #
        # set-hook -g client-dark-theme {
        #   set -g @catppuccin_flavor "mocha"
        #   set -g @catppuccin_reset "true"
        #   run ${catppuccin}
        # }
        # set-hook -g client-light-theme {
        #   set -g @catppuccin_flavor "latte"
        #   set -g @catppuccin_reset "true"
        #   run ${catppuccin}
        # }
      ''
      (builtins.readFile ./extra.config)
      # tmux
      ''
        # README:
        # es: Siempre se carga la confi' de catppuccin/tmux que no usa la
        # arroba pa' los nombres de los variables despues de que se ejecuta `run
        # <nix-store>/catppuccin.tmux`.
        # en: Always load the config for catppuccin/tmux that doesn't use the
        # at-sign for variable names after the `run <nix-store>/catppuccin.tmux`
        # command.
        source "${./catppuccin/config/after.config}"

        # es: Ejecuta continuum al final porque afecta la opción
        # `status-right` se usa por el complemento.
        # en: Run continuum at the end because the `status-right` option is
        # used by the plugin.
        run "${continuum}"
      ''
    ];
  };

  # es: Ayuda con recargando la barra de estado de Tmux usando Catppuccin.
  # en: Helps with reloading the Tmux status line using Catppuccin.
  home.file.".local/bin/reload-catppuccin-tmux".source =
    "${reload-catppuccin-tmux}/bin/reload-catppuccin-tmux";
}
