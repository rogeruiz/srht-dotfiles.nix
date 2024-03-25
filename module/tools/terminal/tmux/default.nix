{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = builtins.readFile ./plugins/catppuccin.config;
      }
    ];
    mouse = true;
    shell = "/etc/profiles/per-user/yo/bin/zsh";
    shortcut = "b";
    terminal = "tmux-256color";
    clock24 = true;
    tmuxp.enable = true;
    escapeTime = 0;
    extraConfig = builtins.readFile ./extra.config;
  };
}

