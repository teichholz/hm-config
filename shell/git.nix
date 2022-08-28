{ pkgs, lib, config, ... }:

let configDir = builtins.toString (config.variables.dotDir + /config); in
{
    home.packages = with pkgs; [
      gitAndTools.gh
      gitAndTools.git-open
      gitAndTools.delta
      act
    ];

    xdg.configFile = {
      "git/config".source = "${configDir}/git/config";
      "git/ignore".source = "${configDir}/git/ignore";
    };

    zsh.rcFiles = [ "${configDir}/git/aliases.zsh" ];
}
