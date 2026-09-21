{ config, lib, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" "kvm-amd" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.overdrive.enable = true;

  services.lact.enable = true;

}
