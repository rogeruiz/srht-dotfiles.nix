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

  programs.zsh = {
    enable = true;
    shellAliases = {
      g = "git";
      nv = "nvim";
      nvd = "nvim -d";
      "\"-\"" = "cd -";
      ".." = "cd ..";
      "..." = "cd ../..";
      l = "exa -xa";
      ll = "exa -lah --git";
      _ = "sudo";
      pls = "sudo";
      please = "sudo";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "viins";
    initExtraFirst = "eval \"$(starship init zsh)\"";
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      fuzzback
      jump
      resurrect
      sensible
      tmux-thumbs
    ];
    mouse = true;
    shell = "/etc/profiles/per-user/yo/bin/zsh";
    shortcut = "b";
    terminal = "tmux-256color";
    tmuxp.enable = true;
  };

}
