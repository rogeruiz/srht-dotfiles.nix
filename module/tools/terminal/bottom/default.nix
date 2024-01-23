{ pkgs, config, ... }:

let
  # Because I'm using Flakes, I need to provide the absolute path for the
  # `config` file rather than letting it be relative.
  # NOTE: I want to figure out a way to build this full path so I don't have to
  # remember all these directories.
  configFile = "${config.home.homeDirectory}/.files.nix/module/tools/terminal/bottom/bottom.toml";
in
{
  home.packages = with pkgs; [ bottom ];

  programs.bottom = {
    enable = true;
  };

  xdg.configFile = {
    "bottom/.base.toml".source = (config.lib.file.mkOutOfStoreSymlink configFile);
    "bottom/catppuccin" = {
      source = builtins.fetchGit {
        url = "https://github.com/catppuccin/bottom.git";
        ref = "main";
        rev = "c0efe9025f62f618a407999d89b04a231ba99c92";
      };

      # NOTE: Usamos el tema de Mocha la primera vez.
      onChange = ''
        cat ~/.config/bottom/.base.toml \
            ~/.config/bottom/catppuccin/themes/mocha.toml \
            > ~/.config/bottom/bottom.toml
      '';
      recursive = true;
    };
  };

}
