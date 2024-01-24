{ inputs, username }:

system:

let
  system-config = import ../module/configuration.nix;
  home-manager-config = import ../module/home-manager.nix;
  security-config = import ../module/security/pam.nix;
  nighthook-config = import ../module/launchd/nighthook.nix;
in
inputs.darwin.lib.darwinSystem {
  inherit system;
  # modules: allows for reusable code
  modules = [
    nighthook-config
    {
      services.nix-daemon.enable = true;
      users.users.${username}.home = "/Users/${username}";
      system.defaults.loginwindow.autoLoginUser = username;
    }
    security-config
    system-config

    inputs.home-manager.darwinModules.home-manager
    {
      # add home-manager settings here
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = home-manager-config;
    }
    # add more nix modules here

  ];
}
