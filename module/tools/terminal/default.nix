# Home Manager Nix module for various Terminal things
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

{ pkgs, config, ... }:

let
  terminalPath = "${config.home.homeDirectory}/.files.nix/module/tools/terminal";
  starshipFile = "${terminalPath}/starship.toml";
  variablesFile = "${terminalPath}/variables.sh";
  functionsFile = "${terminalPath}/functions.sh";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    ./bat
    ./bottom
    ./alacritty
    ./ghostty
    ./tmux

    # NOTE: Esto se configura aquí pero se activo en `module/configuration.nix`
    # como un servicio
    ../sketchybar
  ];

  home.packages = with pkgs; [
    # Herramientas que uso porque me gusta el terminal
    starship
    pv
    ranger
    httpie
    lorri
    unar
    blahaj
    entr
    catimg
    lynx
    htop
    nowplaying-cli

    # Herramientas que yo uso pa' que Darwin se sienta más como Linux
    cmake
    coreutils
    curl
    gawk
    moreutils
    pam-reattach
    reattach-to-user-namespace
    wget

    # Herramientas que me gustan y remplazan las herramientas clasicas escritos
    # en Rust
    choose
    du-dust
    eza
    fd
    grex
    jq
    just
    procs
    ripgrep
    rm-improved
    sd
    tealdeer
    tokei
    vivid
    zoxide

    keychain
    _1password-cli
  ];

  home.file.".inputrc".text = ''
    set show-all-if-ambiguous on
    set completion-ignore-case on
    set mark-directories on
    set mark-symlinked-directories on
    set match-hidden-files off
    set visible-stats on
    set keymap vi
    set editing-mode vi-insert
  '';

  programs.zsh = {
    enable = true;
    shellAliases = {
      g = "git";
      j = "just";
      nv = "nvim";
      ndf = "nvim -d";
      "-" = "cd -";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      l = "eza -xa";
      ll = "eza -lah --git";
      lll = "eza -lah --git -T --git-ignore";
      _ = "sudo";
      pls = "sudo";
      please = "sudo";
      # TODO: Por ahora tengo un alias pero quiero poner estos fuentes adentro
      # de la desviación de Figsay.
      fs = "figsay -d ~/Developer/oss/figlet.js/fonts";
    };
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    initContent = (builtins.readFile ./zshrc);

    autocd = true;
  };

  xdg.configFile = {
    "starship.toml".source = (link starshipFile);
  };

  home.file.".local/share/rstrz/.variables".source = (link variablesFile);
  home.file.".local/share/rstrz/.functions".source = (link functionsFile);
}
