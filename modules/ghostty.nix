{ config, pkgs, lib, ... }:

let
  cfg = {
    font-family = "JetBrains Mono";
    font-size = 11;
    theme = "catppuccin-mocha";
    background-opacity = 0.95;
    window-padding-x = 8;
    window-padding-y = 6;
    cursor-style = "block";
    shell-integration = "detect";
  };
in
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    settings = cfg;
  };
}
