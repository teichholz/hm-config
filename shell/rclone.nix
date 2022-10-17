{ pkgs, lib, config, ... }:

with config.variables;
{
    home.packages = with pkgs; [
      rclone
    ];

    # xdg.configFile = {
    #   "lf" = { 
    #     source = configDir + /lf;
    #     recursive = true;
    #   };
    # };
}
