{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hardware-gpu.nix
    ./modules/boot.nix
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/openrgb.nix
    ./modules/niri.nix
    ./modules/noctalia.nix
    ./modules/llama-cpp.nix
    ./modules/dev.nix
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

  programs.zsh.enable = true;
  users.users.anasied.shell = pkgs.zsh;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
  ];

  system.stateVersion = "26.05";
}
