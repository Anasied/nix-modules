{ config, pkgs, lib, ... }:

{
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server.autoStart = true;
  };

  environment.systemPackages = with pkgs; [
    openrgb
  ];
}
