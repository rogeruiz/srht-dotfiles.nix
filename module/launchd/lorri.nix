{ pkgs, ... }:

{
  launchd.user.agents.lorri = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.lorri}/bin/lorri"
        "daemon"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/var/tmp/lorri.log";
      StandardErrorPath = "/var/tmp/lorri.log";
      EnvironmentVariables = {
        PATH = "${pkgs.nix}/bin";
        NIX_PATH = "/nix/var/nix/profiles/per-user/root/channels";
      };
    };
  };
}
