{ pkgs, ... }:

# Nix Darwin configuration
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

{
  imports = [
    ./tools/yabai
    ./tools/skhd
  ];

  # add more system settings here
  nix = {
    settings = {
      auto-optimise-store = pkgs.stdenv.isLinux;
      builders-use-substitutes = true;
      experimental-features = [ "flakes" "nix-command" ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment = {
    etc."pam.d/sudo_local".text = ''
      # Managed by Nix Darwin
      auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
      auth       sufficient     pam_tid.so
    '';
    systemPackages = with pkgs; [
      git
      alacritty
      starship
      coreutils
      moreutils
      jq

      skhd
    ];
  };

  # environment.systemPath = [ "/usr/local/bin" ];
  # environmentpathsToLink = [ "/Applications" ];

  programs.zsh.enable = true;

  services.nix-daemon.enable = true;

  # NOTE: Eso se tiene que hacer a nivel de sistema y no de hogar. Por ahora,
  # no voy hacer la configuración aqui pero se puede hacer. La configuración de
  # Sketchybar esta en `./tools/sketchybar/default.nix` y se envoca a través de
  # *Home Manager*.
  services.sketchybar.enable = true;

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "0xProto"
          "Recursive"
        ];
      })
    ];
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      menuExtraClock.IsAnalog = true;

      NSGlobalDomain = {
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        ApplePressAndHoldEnabled = false;
        NSWindowShouldDragOnGesture = true;
      };

      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.0;
        launchanim = false;
        magnification = false;
        mineffect = "suck";
        showhidden = true;
        # slow-motion-allowed = true; # FIX: Puedo usar esto cuando se integra LnL7/nix-darwin#1094
        static-only = true;
        wvous-br-corner = 5;
        wvous-tr-corner = 13;
      };
    };
  };

  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    # masApps = {};
    casks = [
      "adobe-creative-cloud"
      "anki"
      "audacity"
      "aws-vault"
      "docker"
      "dropbox"
      "equinox"
      "firefox"
      "flux"
      "handbrake"
      "hot"
      "imageoptim"
      "iterm2"
      "keybase"
      "lagrange"
      "postman"
      "rar"
      "soulver"
      "spotify"
      "stats"
      "time-out"
      "transmission"
      "virtualbox"
      "visual-studio"
      "visual-studio-code"
      "wireshark"
      "writer"
      "zoom"
      # WARN: Estas aplicaciones estan instaladas fuera de Homebrew
      # "1password"
      # "launchbar"
      # "slack"
      # "the-archive"
    ];
    taps = [
      # "sparkbox/commit-colors"

      # INFO: para `visual-studio` en `casks = [] de arriba`
      "homebrew/cask-versions"
    ];
    brews = [
      # "sparkbox/commit-colors/commit-colors"
    ];
  };

}
