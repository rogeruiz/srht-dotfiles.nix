# Home Manager Nix module for Ghostty
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

{ config, ... }:

let
  configFile = "${config.home.homeDirectory}/.files.nix/module/tools/terminal/ghostty/config";
  link = config.lib.file.mkOutOfStoreSymlink;
in

{
  xdg.configFile = {
    "ghostty/config".source = (link configFile);

    "ghostty/shaders" = {
      source = builtins.fetchGit {
        url = "https://github.com/hackr-sh/ghostty-shaders";
        ref = "main";
        rev = "a17573fb254e618f92a75afe80faa31fd5e09d6f";
      };
    };
  };
}
