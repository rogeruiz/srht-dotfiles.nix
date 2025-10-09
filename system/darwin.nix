# Nix module for Nix Darwin
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

{ inputs, username }:

system:

inputs.darwin.lib.darwinSystem {
  inherit system inputs;
  modules = [
    ../module/launchd/lorri.nix
    ../module/launchd/nighthook
    {
      users.users.${username}.home = "/Users/${username}";
      system.defaults.loginwindow.autoLoginUser = username;
    }
    ../module/security/pam.nix
    ../module/common/system-shared.nix
    ../module/configuration.nix
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}".imports = [
        ../module/home-manager.nix
      ];
    }
  ];
}
