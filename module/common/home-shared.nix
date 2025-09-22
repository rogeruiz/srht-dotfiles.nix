{ pkgs, ... }:
{
  # Shared user (Home Manager) configuration for both Darwin and Linux
  imports = [
    ../tools/terminal
    ../tools/git
    ../tools/editor
  ];

  home.packages = with pkgs; [
    nushell
    powershell
    exercism
    zstd
    ffmpeg
    imagemagick
    irssi
    fortune-kind
    nnn
  ];
  home.stateVersion = "24.11";

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };
}
