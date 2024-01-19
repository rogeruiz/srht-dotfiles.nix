{ pkgs, config, ... }:

let
  # Because I'm using Flakes, I need to provide the absolute path for the
  # `config` file rather than letting it be relative.
  # NOTE: I want to figure out a way to build this full path so I don't have to
  # remember all these directories.
  configFile = "${config.home.homeDirectory}/Developer/oss/rogeruiz/srht/.files.nix/module/tools/terminal/bat/config";
in
{
  home.packages = with pkgs; [ bat ];

  xdg.configFile = {
    "bat/config".source = (config.lib.file.mkOutOfStoreSymlink configFile);
    "bat/theme".source = builtins.fetchGit {
      url = "https://github.com/catppuccin/bat.git";
      ref = "main";
      rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    };
  };
}
