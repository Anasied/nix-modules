{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser

    pkgs.ayugram-desktop
    pkgs.vicinae
    pkgs.zed-editor
    pkgs.yazi
    pkgs.opencode
    pkgs.vesktop
    pkgs.obsidian
  ];
}
