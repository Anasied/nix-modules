{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [

    python3
    python3Packages.pip
    python3Packages.virtualenv

    rustc
    cargo
    rustfmt
    clippy

    nodejs_22
    nodePackages.pnpm
    nodePackages.typescript

    gcc
    clang
    cmake
    ninja
    gdb
  ];
}
