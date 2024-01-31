{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.security.pam;
in
{
  # WARN: This file only exists here because the following PR is not merged
  # upstream: https://github.com/LnL7/nix-darwin/pull/662. Once they do exist,
  # I'll be removing this file from my configuration.
  options = {
    security.pam = {
      # README: Renamed here to include the `Patch` suffix to avoid collision with
      # upstream option of the same name
      enableSudoTouchIdAuthPatch = mkEnableOption ''
        Enable sudo authentication with Touch ID

        When enabled, this option adds the following line to /etc/pam.d/sudo:

            auth       sufficient     pam_tid.so

        (Note that macOS resets this file when doing a system update. As such, sudo
        authentication with Touch ID won't work after a system update until the nix-darwin
        configuration is reapplied.)
      '';
      enablePamReattach = mkEnableOption ''
        Enable re-attaching a program to the user's bootstrap session.

        This allows programs like tmux and screen that run in the background to
        survive across user sessions to work with PAM services that are tied to the
        bootstrap session.

        When enabled, this option adds the following line to /etc/pam.d/sudo:

            auth       optional       /path/in/nix/store/lib/pam/pam_reattach.so"

        (Note that macOS resets this file when doing a system update. As such, sudo
        authentication with Touch ID won't work after a system update until the nix-darwin
        configuration is reapplied.)
      '';
      sudoPamFile = mkOption {
        type = types.path;
        default = "/etc/pam.d/sudo";
        description = ''
          Defines the path to the sudo file inside pam.d directory.
        '';
      };
    };
  };

  config = {
    environment.pathsToLink = optional cfg.enablePamReattach "/lib/pam";

    system.patches =
      if cfg.enableSudoTouchIdAuthPatch && cfg.enablePamReattach
      then [
        (pkgs.writeText "pam-reattach-tid.patch" ''
          --- a/etc/pam.d/sudo
          +++ b/etc/pam.d/sudo
          @@ -1,4 +1,6 @@
           # sudo: auth account password session
          +auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
          +auth       sufficient     pam_tid.so
           auth       sufficient     pam_smartcard.so
           auth       required       pam_opendirectory.so
           account    required       pam_permit.so
        '')
      ]
      else if cfg.enableSudoTouchIdAuthPatch && !cfg.enablePamReattach
      then [
        (pkgs.writeText "pam-tid.patch" ''
          --- a/etc/pam.d/sudo
          +++ b/etc/pam.d/sudo
          @@ -1,4 +1,5 @@
           # sudo: auth account password session
          +auth       sufficient     pam_tid.so
           auth       sufficient     pam_smartcard.so
           auth       required       pam_opendirectory.so
           account    required       pam_permit.so
        '')
      ]
      else if !cfg.enableSudoTouchIdAuthPatch && cfg.enablePamReattach
      then [
        (pkgs.writeText "pam-reattach.patch" ''
          --- a/etc/pam.d/sudo
          +++ b/etc/pam.d/sudo
          @@ -1,4 +1,5 @@
           # sudo: auth account password session
          +auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
           auth       sufficient     pam_smartcard.so
           auth       required       pam_opendirectory.so
           account    required       pam_permit.so
        '')
      ]
      else [ ];
  };
}

