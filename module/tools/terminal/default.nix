{ pkgs, ... }:

{
  imports = [
    ./bat
  ];

  home.packages = with pkgs; [
    pv
    gawk
    ranger
    httpie
    direnv
    blahaj
    entr
    catimg
    lynx
    tealdeer
    htop

    coreutils
    curl
    wget

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
  ];
}
