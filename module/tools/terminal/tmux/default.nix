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
  # catppuccin-tmux-path = "${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux";
  catppuccin-tmux-path = "/Users/yo/Developer/oss/rogeruiz/github/catppuccin-tmux/catppuccin.tmux"; # NOTE: pa' el desarrollo
  reload-catppuccin-tmux = (
    pkgs.writeShellApplication {
      name = "reload-catppuccin-tmux";
      runtimeInputs = [
        pkgs.tmux
      ];
      text = lib.concatLines [
        # bash
        ''
          catppuccin_tmux_path_from_nix_store="${catppuccin-tmux-path}"
          catppuccin_config="${./plugins/catppuccin.config}"
          catppuccin_after_config="${./plugins/catppuccin.after.config}"
        ''
        (builtins.readFile ./reload-catppuccin-tmux.sh)
      ];
    }
  );
in
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = builtins.readFile ./plugins/catppuccin.config;
      }
      {
        plugin = continuum;
        extraConfig = builtins.readFile ./plugins/continuum.config;
      }
      {
        plugin = resurrect;
        extraConfig = builtins.readFile ./plugins/resurrect.config;
      }
    ];
    mouse = true;
    shell = "/etc/profiles/per-user/yo/bin/zsh";
    shortcut = "b";
    terminal = "tmux-256color";
    clock24 = true;
    tmuxp.enable = true;
    escapeTime = 0;
    extraConfig = lib.concatLines [
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
        #   run ${catppuccin-tmux-path}
        # }
        # set-hook -g client-light-theme {
        #   set -g @catppuccin_flavor "latte"
        #   set -g @catppuccin_reset "true"
        #   run ${catppuccin-tmux-path}
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
        source "${./plugins/catppuccin.after.config}"

        # es: Ejecuta continuum al final porque afecta la opción
        # `status-right` se usa por el complemento.
        # en: Run continuum at the end because the `status-right` option is
        # used by the plugin.
        run "${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux"
      ''
    ];
  };

  home.file.".local/bin/reload-catppuccin-tmux".source =
    "${reload-catppuccin-tmux}/bin/reload-catppuccin-tmux";
}
