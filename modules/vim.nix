{ pkgs, lib, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set number
      set relativenumber
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set ignorecase
      set smartcase
      syntax on
    '';
  };
}
