{ pkgs, lib, ... }:

let
  utils = import ../utils { inherit pkgs; };
  catppuccin = utils.catppuccin { local = true; };
  before = ../config/before.config;
  after = ../config/after.config;
  ventana = import ../modules/ventana { inherit pkgs; };
in

pkgs.writeShellApplication {
  name = "reload-catppuccin-tmux";
  runtimeInputs = [
    pkgs.tmux
  ];
  text = lib.concatLines [
    # bash
    ''
      if [[ "$TMUX" != "" ]]; then
        if defaults read -g AppleInterfaceStyle &>/dev/null; then
          sabor="mocha"
        else
          sabor="latte"
        fi

        tmux set -g @catppuccin_flavor "$sabor"
        tmux set -g @catppuccin_reset "true"
        # shellcheck disable=SC2154
        tmux run -d 1 "${catppuccin}"
        # shellcheck disable=SC2154,1090
        tmux source "${before}"
        tmux set -g @catppuccin_flavor $sabor

        # Modules {
        tmux source "${ventana}/share/ventana.config"
        # }

        # shellcheck disable=SC2154
        tmux run -d 1 "${catppuccin}"
        # shellcheck disable=SC2154,1090
        tmux source "${after}"
      fi
    ''
  ];
}
