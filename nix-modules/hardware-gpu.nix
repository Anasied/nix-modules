{ config, pkgs, lib, ... }:

{
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages;

  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xffffffff"
  ];
}
