# Nix Flake for .files
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
  # NOTE: It's macOS for now until I learn more Nix. Eventually, I'd like to port
  # over my work in ~/rogeruiz/chromebook113180 on sourcehut too.
  description = "@rogeruiz using Nix on macOS environment.";

  # NOTE: These inputs are where all the packages are.
  inputs = {
    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    inputs@{
      self,
      darwin,
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      ...
    }:
    let
      darwin-system = import ./system/darwin.nix { inherit inputs username; };
      username = "yo";
    in
    {
      darwinConfigurations = {
        mbpro-16-1 = darwin-system "x86_64-darwin";
      };
      nixosConfigurations = {
        mbpro-11-5 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./system/nixos.nix
          ];
        };
      };
      homeConfigurations = {
        "yo@mbpro-11-5" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./module/home-manager.nix
          ];
        };
      };
    };
}
