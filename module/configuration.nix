{ pkgs, ... }:

{
  imports = [
    ./tools/yabai
    ./tools/skhd
  ];

  # add more system settings here
  nix = {
    settings = {
      auto-optimise-store = true;
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

  environment.systemPackages = with pkgs; [
    git
    alacritty
    starship
    coreutils
  ];

  # environment.systemPath = [ "/usr/local/bin" ];
  # environmentpathsToLink = [ "/Applications" ];

  programs.zsh.enable = true;

  services.nix-daemon.enable = true;

  # NOTE: Eso se tiene que hacer a nivel de sistema y no de hogar. Por ahora,
  # no voy hacer la configuración aqui pero se puede hacer.
  services.sketchybar.enable = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    ];
  };

  security.pam.enableSudoTouchIdAuth = true;

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

      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.0;
        launchanim = false;
        magnification = false;
        mineffect = "suck";
        showhidden = true;
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
      # "1password"
      "adobe-creative-cloud"
      "anki"
      "audacity"
      "aws-vault"
      "docker"
      "dropbox"
      "firefox"
      "flux"
      "handbrake"
      "hot"
      "imageoptim"
      "iterm2"
      "keybase"
      # "launchbar"
      "lagrange"
      "postman"
      "rar"
      # "slack"
      "soulver"
      "spotify"
      "time-out"
      "transmission"
      "virtualbox"
      "visual-studio-code"
      "wireshark"
      "writer"
      "zoom"
    ];
    taps = [
      # "sparkbox/commit-colors"
    ];
    brews = [
      # "sparkbox/commit-colors/commit-colors"
    ];
  };

}
