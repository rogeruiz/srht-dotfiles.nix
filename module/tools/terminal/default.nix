{ pkgs, config, ... }:

let
  terminalPath = "${config.home.homeDirectory}/.files.nix/module/tools/terminal";
  alacrittyFile = "${terminalPath}/alacritty.toml";
  starshipFile = "${terminalPath}/starship.toml";
  variablesFile = "${terminalPath}/variables.sh";
  functionsFile = "${terminalPath}/functions.sh";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    ./bat
    ./bottom
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

    # Base terminal tools we all need
    cmake
    coreutils
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
      nv = "nvim";
      nvd = "nvim -d";
      "-- -" = "cd -";
      ".." = "cd ..";
      "..." = "cd ../..";
      l = "exa -xa";
      ll = "exa -lah --git";
      lll = "exa -lah --git -T --git-ignore";
      _ = "sudo";
      pls = "sudo";
      please = "sudo";
      # PERF: Un alias para tener una manera facil pa' matar el proceso de
      # `legacyScreenSaver` porque tomar muchos recursos de la computadora.
      killscreen = "kill -9 $(ps aux | rg -v rg | rg legacyScreenSaver | awk '{ print $2 }')";
    };
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    initExtraFirst = (builtins.readFile ./zshrc);
    autocd = true;
  };

  xdg.configFile = {
    "alacritty/alacritty.toml".source = (link alacrittyFile);
    "starship.toml".source = (link starshipFile);
  };

  home.file.".local/share/rstrz/.variables".source = (link variablesFile);
  home.file.".local/share/rstrz/.functions".source = (link functionsFile);
}
