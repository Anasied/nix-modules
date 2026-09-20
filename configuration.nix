{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./modules/hardware-gpu.nix
    ./modules/boot.nix
    ./modules/lact.nix
    ./modules/openrgb.nix
    ./modules/niri.nix
    ./modules/noctalia.nix
    ./modules/llama-cpp.nix
    ./modules/vim.nix
    ./modules/dev.nix
    ./modules/packages.nix
  ];

  networking.hostName = "nixos";
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  users.users.anasied = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "render" "networkmanager" "docker" ];
    initialPassword = "0904";
  };

  security.sudo.wheelNeedsPassword = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
  ];

  system.stateVersion = "26.05";
}
