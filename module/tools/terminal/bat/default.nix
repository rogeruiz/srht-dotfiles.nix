# Home Manager Nix module for Bat
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
  # Because I'm using Flakes, I need to provide the absolute path for the
  # `config` file rather than letting it be relative.
  # NOTE: I want to figure out a way to build this full path so I don't have to
  # remember all these directories.
  configFile = "${config.home.homeDirectory}/.files.nix/module/tools/terminal/bat/config";

  themeRepo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
  };
in
{
  programs.bat = {
    enable = true;
    themes = {
      catppuccin-latte = {
        src = themeRepo;
        file = "Catppuccin-latte.tmTheme";
      };
      catppuccin-mocha = {
        src = themeRepo;
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };

  xdg.configFile = {
    "bat/config".source = (config.lib.file.mkOutOfStoreSymlink configFile);
  };
}
