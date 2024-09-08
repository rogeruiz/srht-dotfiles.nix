{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    neovim
    deno
    prettierd
  ];
}
