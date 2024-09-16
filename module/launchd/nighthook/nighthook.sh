if defaults read -g AppleInterfaceStyle &>/dev/null; then
  MODE="dark"
  FLAVOR="mocha"
  COLORFGBG_VALUE=""
else
  MODE="light"
  FLAVOR="latte"
  COLORFGBG_VALUE="1;15"
fi

cambia_tema() {
  # shellcheck disable=SC2154
  DIR="${HOME}/.files.nix/module/tools"

  # NOTE: Alacritty
  sed -E \
    -i "" \
    "s/(catppuccin-[a-z]+.toml)/catppuccin-$FLAVOR.toml/" \
    "$DIR"/terminal/alacritty.toml

  # NOTE: Starship
  sed -E \
    -i "" \
    "s/^(palette = ).+$/\1\"$MODE\"/" \
    "$DIR"/terminal/starship.toml

  # NOTE: Bat
  sed -E \
    -i "" \
    "s/^(--theme=).+$/\1catppuccin-$FLAVOR/" \
    "$DIR"/terminal/bat/config

  # NOTE: GH-Dash
  sed -E \
    -i "" \
    "s/(colors: \*).+$/\1${MODE}/" \
    "$DIR"/git/gh-dash.yml

  # NOTE: Bottom
  cat \
    ~/.config/bottom/.base.toml \
    ~/.config/bottom/catppuccin/themes/$FLAVOR.toml \
    >~/.config/bottom/bottom.toml

  # NOTE: Nvim
  # Para Neovim, es mejor ver si ya esta selecionado el tema y no
  # cambiar el archivo si el tema no ha cambiado

  if ! "$RIPGREP_BIN" "vim.o.background = \"$MODE\"" \
    ~/.config/nvim/lua/custom/plugins/catppuccin.lua \
    >/dev/null 2>&1; then
    sed -E \
      -i "" \
      "s/(vim.o.background = ).+$/\1\"$MODE\"/" \
      ~/.config/nvim/lua/custom/plugins/catppuccin.lua
  fi

  # NOTE: Tmux

  "$TMUX_BIN" set -g "@catppuccin_flavour" "$FLAVOR"
  "$TMUX_BIN" run "$CATPPUCCIN_TMUX"

  # NOTE: LS_COLORS (exa, fd, rg)
  sed -E \
    -i "" \
    "s/(catppuccin-)[a-z]+/\1$FLAVOR/" \
    "${DIR}"/terminal/variables.sh

  # NOTE: COLORFGBG (gh)
  sed -E \
    -i "" \
    "s/(export COLORFGBG=)\".*\"/\1\"$COLORFGBG_VALUE\"/" \
    "${DIR}"/terminal/variables.sh

}

cambia_tema "$@"
