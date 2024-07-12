{
  # NOTE: It's macOS for now until I learn more Nix. Eventually, I'd like to port
  # over my work in ~/rogeruiz/chromebook113180 on sourcehut too.
  description = "@rogeruiz using Nix on macOS environment.";

  # NOTE: These inputs are where all the packages are.
  inputs = {
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = inputs@{ self, darwin, home-manager, nixpkgs, nixpkgs-stable, ... }:
    let
      darwin-system = import ./system/darwin.nix { inherit inputs username; };
      username = "yo";
    in
    {
      darwinConfigurations = {
        x86_64 = darwin-system "x86_64-darwin";
      };
    };
}
