# Nix module for setting up custom Night Hook launchd service
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

{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  homeDir = "/Users/yo";
  rgBin = "${pkgs.ripgrep}/bin/rg";
  tmuxBin = "${pkgs.tmux}/bin/tmux";
  catppuccinTmux = "${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux";
  # FIX:
  # es: Este variable deber ser una derivación y no una referencia a mí guion directamente.
  # en: This variable should be pointing to a derivation and not a script file reference.
  reloadTmuxCatppuccin = "${homeDir}/.local/bin/reload-catppuccin-tmux";
in
{
  launchd.user.agents.nighthook = {
    serviceConfig = {
      Label = "gr.rog.nighthook";
      WatchPaths = [ "${homeDir}/Library/Preferences/.GlobalPreferences.plist" ];
      EnvironmentVariables = {
        PATH = (replaceStrings [ "$HOME" ] [ homeDir ] config.environment.systemPath);
        HOME = homeDir;
        RIPGREP_BIN = rgBin;
        TMUX_BIN = tmuxBin;
        CATPPUCCIN_TMUX = catppuccinTmux;
        RELOAD_TMUX_CATPPUCCIN_SCRIPT = reloadTmuxCatppuccin;
      };
      Program = "${pkgs.writeShellScript "nighthook-action" (builtins.readFile ./nighthook.sh)}";
    };
  };
}
