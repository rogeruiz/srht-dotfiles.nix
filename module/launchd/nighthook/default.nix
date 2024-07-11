{ config
, lib
, pkgs
, ...
}:
with lib; let
  homeDir = "/Users/yo";
  rgBin = "${pkgs.ripgrep}/bin/rg";
  tmuxBin = "${pkgs.tmux}/bin/tmux";
  catppuccinTmux = "${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux";
in
{
  launchd.user.agents.nighthook = {
    serviceConfig = {
      Label = "gr.rog.nighthook";
      WatchPaths = [ "${homeDir}/Library/Preferences/.GlobalPreferences.plist" ];
      EnvironmentVariables = {
        PATH = (replaceStrings [ "$HOME" ] [ homeDir ] config.environment.systemPath);
        HOME = homeDir;
        RIPGREP_BIN = rgBin;
        TMUX_BIN = tmuxBin;
        CATPPUCCIN_TMUX = catppuccinTmux;
      };
      Program = "${pkgs.writeShellScript "nighthook-action" (builtins.readFile ./nighthook.sh)}";
    };
  };
}
