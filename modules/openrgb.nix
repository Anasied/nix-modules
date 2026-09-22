{ config, pkgs, lib, ... }:

{
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server.port = 6742;
  };

  environment.systemPackages = with pkgs; [
    openrgb
    openrgb-with-all-plugins
  ];
}
