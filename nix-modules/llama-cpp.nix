{ config, pkgs, lib, ... }:

let

  llamaCppRocm = pkgs.llama-cpp-rocm;

  rocmEnv = {
    HSA_OVERRIDE_GFX_VERSION = "11.0.0";
    HIP_VISIBLE_DEVICES = "0";
  };
in
{
  environment.systemPackages = [ llamaCppRocm ];
  environment.sessionVariables = rocmEnv;
}
