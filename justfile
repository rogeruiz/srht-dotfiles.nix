# vi:set ft=make
# This is the justfile for this project.

# Build x86_64 Darwin configuration
build-darwin:
	darwin-rebuild switch --flake ".#x86_64"

# Update all input channels. May take a while
update-all:
  nix flake update

# Update nixpkgs Stable
update-nixpkgs-stable:
  nix flake update nixpkgs-stable

# Update nixpkgs Unstable
update-nixpkgs:
  nix flake update nixpkgs

# Update nix-darwin
update-darwin:
  nix flake update darwin

# Update home-manager
update-home-manager:
  nix flake update home-manager
