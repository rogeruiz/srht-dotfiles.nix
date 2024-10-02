# Home Manager Nix module for Alacritty
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

{ pkgs, config, ... }:

let
  terminalPath = "${config.home.homeDirectory}/.files.nix/module/tools/terminal";
  alacrittyFile = "${terminalPath}/alacritty.toml";
  themeRepo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = "343cf8d65459ac8f6449cc98dd3648bcbd7e3766";
    sha256 = "sha256-5MUWHXs8vfl2/u6YXB4krT5aLutVssPBr+DiuOdMAto=";
  };
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
    "alacritty/alacritty.toml".source = (link alacrittyFile);
    "alacritty/catppuccin-latte.toml".source = "${themeRepo}/catppuccin-latte.toml";
    "alacritty/catppuccin-mocha.toml".source = "${themeRepo}/catppuccin-mocha.toml";
  };
}
