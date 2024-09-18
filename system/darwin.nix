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

let
  system-config = import ../module/configuration.nix;
  home-manager-config = import ../module/home-manager.nix;
  security-config = import ../module/security/pam.nix;
  nighthook-config = import ../module/launchd/nighthook;
  lorri-config = import ../module/launchd/lorri.nix;
in
inputs.darwin.lib.darwinSystem {
  inherit system;
  # modules: allows for reusable code
  modules = [
    lorri-config
    nighthook-config
    {
      services.nix-daemon.enable = true;
      users.users.${username}.home = "/Users/${username}";
      system.defaults.loginwindow.autoLoginUser = username;
    }
    security-config
    system-config

    inputs.home-manager.darwinModules.home-manager
    {
      # add home-manager settings here
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = home-manager-config;
    }
    # add more nix modules here

  ];
}
