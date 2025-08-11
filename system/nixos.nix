{
  # config,
  # lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware/mbpro-11_5.nix
  ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "broadcom-sta-6.30.223.271-57-6.12.39"
      ];
    };
  };

  powerManagement.cpuFreqGovernor = "schedutil";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "mbpro-11-5";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";

  fonts = {
    packages = with pkgs.nerd-fonts; [
      _0xproto
      symbols-only
      recursive-mono
    ];
  };

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      windowManager = {
        hypr = {
          enable = true;
        };
      };
    };
    displayManager = {
      ly = {
        enable = true;
      };
    };
    libinput.enable = true;
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        brlaser
      ];
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };

  programs = {
    firefox = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
  };
  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      curl
      wget
      starship
      git
      neovim
      ghostty
      kitty
      waybar
      dunst
      libnotify
      swww
      rofi-wayland
      wayclip
    ];
  };
  users = {
    users.yo = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = [];
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };

  system.stateVersion = "25.05";
}
