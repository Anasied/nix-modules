{ config, pkgs, lib, ... }:

let
  timeout = 10;
  defaultEntry = "NixOs";
  windowsLabel = "Windows 11";
  espDevice = "/dev/nvme0n1p3";
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

  fileSystems."/boot" = {
    device = espDevice;
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
}
