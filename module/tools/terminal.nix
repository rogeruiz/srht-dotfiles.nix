{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
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
  ];
}
