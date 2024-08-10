[macos]
[doc('Build x86_64 Darwin configuration')]
build-darwin:
	darwin-rebuild switch --flake ".#x86_64"

[doc('Update flake channel from registry')]
update:
  @echo "Updating ./flake.lock and committing it to the repository"
  nix flake update --commit-lock-file
