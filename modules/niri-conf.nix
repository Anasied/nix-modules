{ config, pkgs, lib, ... }:

let
  niriConfig = ''
    binds {
      Mod+Q { close-window; }
      Mod+E { spawn "ghostty"; }
      Mod+B { spawn "zen"; }
    }

    input {
      keyboard {
        xkb {
          layout "us,ru"
          options "grp:alt_shift_toggle"
        }
      }
    }
  '';
in
{
  xdg.configFile."niri/config.kdl".text = niriConfig;
}
