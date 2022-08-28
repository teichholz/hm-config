{ pkgs, lib, config, ... }:

let configDir = config.variables.dotDir + /config; in
{
    home.packages = with pkgs; [
      lf pistol
    ];

    xdg.configFile = {
      "lf" = { 
        source = configDir + /lf;
        recursive = true;
      };
    };
}
