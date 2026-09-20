{ config, pkgs, lib, ... }:

let
  timeout = 10;
  windowsLabel = "Windows 11";
in
{
  boot.loader = {
    systemd-boot = {
      enable = true;
      extraEntries = {
        windows = {
          title = windowsLabel;
          efi = "/EFI/Microsoft/Boot/bootmgfw.efi";
        };
      };
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  boot.loader.timeout = timeout;

  system.nixos.label = "NixOS";
}
