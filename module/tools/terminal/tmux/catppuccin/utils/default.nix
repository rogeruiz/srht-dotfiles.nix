{ pkgs, ... }:
let
  ctp = pkgs.tmuxPlugins.catppuccin;
  dev = "/Users/yo/Developer/oss/rogeruiz/github/catppuccin-tmux/catppuccin.tmux";
in
rec {
  /**
    # es: Este atributo se usa pa' crear modólos de estado pa' Tmux usando
    # Catppuccin.
    # en: This attribute is used to create status modules for Tmux using
    # Catppuccin.
  */
  status-module-path = "${ctp}/share/tmux-plugins/catppuccin/utils/status_module.conf";

  /**
    es: Encontrar los archivos de entrar pa los complementos de Tmux en los
    paquetes de Nix.
    en: Find the entry-files for the Tmux plugins in Nix packages.
  */
  plugin-path-within-nix-store = p: "${p}/share/tmux-plugins/${p.pluginName}/${p.pluginName}.tmux";

  /**
    es: Ayuda con el desarrollo de Catppuccin Tmux.
    en: Helps with the development of Catppuccin Tmux.
  */
  catppuccin = { local ? false }:
    if local
    then dev
    else (plugin-path-within-nix-store ctp);
}
