{ config
, lib
, pkgs
, ...
}:
with lib; let
  homeDir = "/Users/yo";
in
{
  launchd.user.agents.nighthook = {
    serviceConfig = {
      Label = "gr.rog.nighthook";
      WatchPaths = [ "${homeDir}/Library/Preferences/.GlobalPreferences.plist" ];
      EnvironmentVariables = {
        PATH = (replaceStrings [ "$HOME" ] [ homeDir ] config.environment.systemPath);
      };
      ProgramArguments = [
        ''${pkgs.writeShellScript "nighthook-action" ''
            if defaults read -g AppleInterfaceStyle &>/dev/null; then
              MODE="dark"
              FLAVOR="mocha"
            else
              MODE="light"
              FLAVOR="latte"
            fi

            cambia_tema() {
              DIR="${homeDir}/.files.nix/module/tools/terminal"

              # NOTE: Alacritty
              sed -E \
                -i "" \
                "s/(catppuccin-[a-z]+.toml)/catppuccin-$FLAVOR.toml/" \
                $DIR/alacritty.toml

              # NOTE: Starship
              sed -E \
                -i "" \
                "s/^(palette = ).+$/\1\"$MODE\"/" \
                $DIR/starship.toml

              # NOTE: Bat
              sed -E \
                -i "" \
                "s/^(--theme=).+$/\1catppuccin-$FLAVOR/" \
                $DIR/bat/config

              # NOTE: Bottom
              cat \
                ~/.config/bottom/.base.toml \
                ~/.config/bottom/catppuccin/themes/$FLAVOR.toml \
                > ~/.config/bottom/bottom.toml

              # NOTE: Nvim
              sed -E \
                -i "" \
                "s/(vim.o.background = ).+$/\1\"$MODE\"/" \
                ~/.config/nvim/lua/custom/plugins/catppuccin.lua

              # NOTE: Tmux
              ${pkgs.tmux}/bin/tmux set -g "@catppuccin_flavour" $FLAVOR
              ${pkgs.tmux}/bin/tmux run ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux

            }

            cambia_tema $@

        ''}''
      ];
    };
  };
}
