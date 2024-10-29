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
    ./tmux

    # NOTE: Esto se configura aquí pero se activo en `module/configuration.nix`
    # como un servicio
    ../sketchybar
  ];

  home.packages = with pkgs; [
    # Some of the tools I like to use in the terminal
    pv
    gawk
    ranger
    httpie
    direnv
    lorri
    unar
    blahaj
    entr
    catimg
    lynx
    htop
    nowplaying-cli

    # Base terminal tools we all need
    cmake
    coreutils
    moreutils
    curl
    wget
    reattach-to-user-namespace
    pam-reattach
    zoxide

    # Some Rust tools that I like to use that replace classic tools not written
    # in Rust
    choose
    vivid
    just
    eza
    ripgrep
    jq
    du-dust
    fd
    procs
    sd
    grex
    tealdeer
    tokei

    keychain
    _1password
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
      l = "exa -xa";
      ll = "exa -lah --git";
      lll = "exa -lah --git -T --git-ignore";
      _ = "sudo";
      pls = "sudo";
      please = "sudo";
    };
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    initExtraFirst = (builtins.readFile ./zshrc);
    autocd = true;
  };

  xdg.configFile = {
    "starship.toml".source = (link starshipFile);
  };

  home.file.".local/share/rstrz/.variables".source = (link variablesFile);
  home.file.".local/share/rstrz/.functions".source = (link functionsFile);
}
