{ pkgs, ... }:

{
  home.packages = with pkgs; [
    universal-ctags
    tree-sitter
    lua-language-server
    nixd
    yaml-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    # python312Packages.python-lsp-server
    marksman
    go
    shellcheck
    shfmt
  ];
}
