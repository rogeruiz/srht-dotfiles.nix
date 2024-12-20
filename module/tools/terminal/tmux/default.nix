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

{ pkgs, ... }:

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
    extraConfig = builtins.readFile ./extra.config;

    # TODO: No hay un `extraConfigBeforePlugins` pa poner esto. Creo que lo
    # mejor que puedo hacer aquí es hacer un archivo que tieno las referencias
    # a `${pkgs}` y incluirlo en el `./extra.config` archivo con un commando
    # usando `source ~/.config/tmux/extra-bindings`.
    # extraConfigBeforePlugins = ''
    #   # Atajo pa' recargar Catppuccin atravez de Tmux
    #   tmux bind -N "Reload Catppuccin" g run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux \; display-message "Catppuccin Reloaded"
    # '';

  };
}
