{
  # NOTE: It's macOS for now until I learn more Nix. Eventually, I'd like to port
  # over my work in ~/rogeruiz/chromebook113180 on sourcehut too.
  description = "@rogeruiz using Nix on macOS environment.";

  # NOTE: These inputs are where all the packages are.
  inputs = {
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = inputs@{ self, darwin, home-manager, nixpkgs, nixpkgs-stable, ... }:
    let
      darwin-system = import ./system/darwin.nix { inherit inputs username; };
      username = "yo";
    in
    {
      darwinConfigurations = {
        x86_64 = darwin-system "x86_64-darwin";
      };

      darwinModules = {
        security-pam = { config, lib, pkgs, ... }:
          with lib;
          let
            cfg = config.security.pam;
            mkSudoTouchIdAuthScript = isEnabled:
              let
                file = "/etc/pam.d/sudo";
                option = "security.pam.enableSudoTouchIdAuth";
              in
              ''
                ${if isEnabled then ''
                  # Enable sudo Touch ID authentication, if not already enabled
                  if ! grep 'pam_id.so' ${file} > /dev/null; then
                    sed -i "" '2i\
                  auth       optional       /usr/local/opt/pam-reattach/lib/pam/pam_reattach.so ignore_ssh # nix-darwin: ${option}
                  auth       sufficient     pam_tid.so # nix-darwin: ${option}
                    ' ${file}
                  fi
                '' else ''
                  # Disable sudo Touch ID authentication, if added by nix-darwin
                  if grep '${option}' ${file} > /dev/null; then
                    sed -i "" '/${option}/d' ${file}
                  fi
                ''}
              '';
          in

          {
            options = {
              security.pam.enableSudoTouchIdAuth = mkEnableOption ''
                Enable sudo authentication with Touch ID
                When enabled, this option adds the following line to
                /etc/pam.d/sudo:
                    auth       optional       /usr/local/opt/pam-reattach/lib/pam/pam_reattach.so ignore_ssh 
                    auth       sufficient     pam_tid.so
                (Note that macOS resets this file when doing a system update. As
                such, sudo authentication with Touch ID won't work after a system
                update until the nix-darwin configuration is reapplied.)
              '';
            };

            config = {
              system.activationScripts.extraActivation.text = ''
                # PAM settings
                echo >&2 "setting up pam..."
                ${mkSudoTouchIdAuthScript cfg.enableSudoTouchIdAuth}
              '';
            };
          };
      };
    };
}
