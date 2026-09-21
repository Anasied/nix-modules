{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      ignoreAllDups = true;
    };
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
  };
}
