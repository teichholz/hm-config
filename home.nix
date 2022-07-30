{ config, pkgs, ... }:

{
  home.username = "tim";
  home.homeDirectory = "/home/tim";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
