{ pkgs, lib, ... }:

let
  zedSettings = {
    theme = {
      mode = "system";
      dark = "One Dark";
      light = "One Light";
    };
    buffer_font_family = "JetBrains Mono";
    buffer_font_size = 14;
    hour_format = "hour24";
    base_keymap = "VSCode";
    autosave = "on_focus_change";
    format_on_save = "on";
  };

  zedExtensions = [
    "nix"
    "rust"
    "toml"
    "python"
    "javascript"
    "typescript"
  ];
in
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = zedExtensions;
    userSettings = zedSettings;
    installRemoteServer = true;
  };
}
