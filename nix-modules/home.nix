{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/vicinae.nix
    ./modules/ghostty.nix
  ];

  home.username = "anasied";
  home.homeDirectory = "/home/anasied";
  home.stateVersion = "26.05";
}
