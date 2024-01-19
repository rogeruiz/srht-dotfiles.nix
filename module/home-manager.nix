{ pkgs, ... }:

{

  imports = [
    ./tools/terminal.nix
    ./tools/git
    # ./tools/rust.nix
    # ./tools/neovim.nix
    # ./tools/languages.nix
    # ./tools/language-servers.nix
    # ./tools/styles.nix
  ];

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        end_of_line = "lf";
        insert_final_newline = true;
        charset = "utf-8";
        indent_style = "space";
        indent_size = 2;
        time_trailing_whitespace = true;
      };

      "*.ledger" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.py" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.{txt,md,markdown}" = {
        indent_style = "space";
        indent_size = 4;
      };
    };
  };

  # add home-manager user settings here
  home.packages = with pkgs; [
    neovim

    nodePackages.typescript
    nodejs

    exercism

    just
    eza
    ripgrep
    jq
    bat
    du-dust
    fd
    procs
    sd
    bottom

    ffmpeg
    imagemagick

    # python3
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
