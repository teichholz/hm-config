{ pkgs, lib, config, ... }:

let configDir = config.variables.dotDir + /config; in
{
    home.packages = with pkgs; [
      lazygit
      gitAndTools.delta
    ];

    xdg.configFile = {
      "lazygit" = { 
        source = configDir + /lazygit;
        recursive = true;
      };
    };
}
