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

    exercism

    python312
    nodePackages.typescript
    nodejs

  ];
  home.stateVersion = "23.11";
}
