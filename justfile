# vi:set ft=make
# This is the justfile for this project.

build-darwin:
	darwin-rebuild switch --flake ".#x86_64"
