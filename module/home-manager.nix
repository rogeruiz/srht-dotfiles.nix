{ pkgs, ... }:

{

  imports = [
    ./tools/terminal
    ./tools/git
    ./tools/editor
    # ./tools/rust.nix
    # ./tools/neovim.nix
    # ./tools/languages.nix
    # ./tools/language-servers.nix
    # ./tools/styles.nix
  ];

  # add home-manager user settings here
  home.packages = with pkgs;
    [
      neovim

      exercism

      # python3
      nodePackages.typescript
      nodejs

      universal-ctags
      tree-sitter
      lua-language-server
      nixd
      yaml-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      # python311Packages.python-lsp-server
      # marksman
      go
      shellcheck
      shfmt
    ];
  home.stateVersion = "23.11";
}
