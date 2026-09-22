{ pkgs, lib, ... }:

let
  vicinaeSettings = {
    favicon_service = "twenty";
    font.normal.size = 10;
    pop_to_root_on_close = false;
    search_files_in_root = false;
    theme = {
      dark.name = "vicinae-dark";
      light.name = "vicinae-light";
    };
    launcher_window.layer_shell.enabled = true;
  };
in
{
  programs.vicinae = {
    enable = true;
    package = pkgs.vicinae;
    settings = vicinaeSettings;

    systemd = {
      enable = true;
      autoStart = true;
      target = "graphical-session.target";
    };
  };
}
