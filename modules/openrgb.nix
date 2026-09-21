{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    openrgb
    openrgb-with-all-plugins
  ];
  systemd.services.openrgb = {
    description = "OpenRGB Server";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.openrgb}/bin/openrgb --server --start-minimized";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
