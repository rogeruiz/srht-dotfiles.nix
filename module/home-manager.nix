# Home Manager module
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
  imports = [
    ./tools/terminal
    ./tools/git
    ./tools/editor
    ./tools/neovim.nix
    # ./tools/languages.nix
    ./tools/language-servers.nix
  ];

  # add home-manager user settings here
  home.packages = with pkgs; [
    nushell
    powershell

    exercism

    zstd

    ffmpeg
    imagemagick

    irssi
  ];
  home.stateVersion = "24.11";

  programs.direnv = {
    enable = true;
    # enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };

}
