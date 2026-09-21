{ config, pkgs, lib, ... }:

let
  timeout = 10;
in
{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };

    timeout = timeout;
  };

  system.nixos.label = "NixOS";
}
