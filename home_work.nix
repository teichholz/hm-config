{ config, pkgs, ... }:

{
  home.username = "teichholz";
  home.homeDirectory = "/home/teichholz";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
