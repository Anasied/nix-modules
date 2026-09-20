{ config, pkgs, inputs, lib, ... }:

{
  environment.systemPackages = with pkgs; [

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser

    vicinae

    zed-editor

    vesktop

    obsidian

    yazi

    opencode
  ];

  virtualisation.docker.enable = true;
}
