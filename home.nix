{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/vicinae.nix
    ./modules/ghostty.nix
    ./modules/zed.nix
    ./modules/yazi.nix
    ./modules/packages.nix
    ./modules/shell.nix
    ./modules/vim.nix
  ];

  home.username = "anasied";
  home.homeDirectory = "/home/anasied";
  home.stateVersion = "26.05";
}
