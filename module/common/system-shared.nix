{ pkgs, ... }:
{
  # Shared system configuration for both Darwin and Linux
  nix = {
    settings = {
      auto-optimise-store = pkgs.stdenv.isLinux;
      builders-use-substitutes = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
    nixPath = [ "nixpkgs=flake:nixpkgs" ];
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment = {
    systemPackages = with pkgs; [
      git
      alacritty
      starship
      coreutils
      moreutils
      jq
      tmux
      # Only add Darwin/Linux specific packages in respective modules
    ];
  };

  fonts = {
    packages = with pkgs.nerd-fonts; [
      _0xproto
      comic-shanns-mono
      commit-mono
      daddy-time-mono
      departure-mono
      fantasque-sans-mono
      fira-code
      heavy-data
      lilex
      monofur
      mononoki
      recursive-mono
      sauce-code-pro
      shure-tech-mono
      symbols-only
      tinos
      zed-mono
    ];
  };
}

