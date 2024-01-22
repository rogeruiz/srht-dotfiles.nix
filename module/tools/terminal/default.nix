{ pkgs, ... }:

{
  imports = [
    ./bat
    ./bottom
  ];

  home.packages = with pkgs; [
    # Some of the tools I like to use in the terminal
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

    # Base terminal tools we all need
    coreutils
    curl
    wget

    # Some Rust tools that I like to use that replace classic tools not written
    # in Rust
    just
    eza
    ripgrep
    jq
    du-dust
    fd
    procs
    sd
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      g = "git";
      nv = "nvim";
      nvd = "nvim -d";
      "\"\\-\"" = "cd -";
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
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    initExtraFirst = (builtins.readFile ./zshrc);
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      # fuzzback
      # jump
      # resurrect
      # sensible
      # tmux-thumbs
    ];
    mouse = true;
    shell = "/etc/profiles/per-user/yo/bin/zsh";
    shortcut = "b";
    terminal = "tmux-256color";
    tmuxp.enable = true;
  };

}
