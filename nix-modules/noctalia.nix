{ config, pkgs, inputs, lib, ... }:

let
  noctaliaPkg =
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  environment.systemPackages = [ noctaliaPkg ];

  networking.networkmanager.enable = true;

}
