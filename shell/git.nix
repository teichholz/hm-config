{ pkgs, lib, config, ... }:

let configDir = builtins.toString config.variables.configDir; in  
{
    home.packages = with pkgs; [
      gitAndTools.gh
      gitAndTools.git-open
      gitAndTools.diff-so-fancy
      act
    ];

    xdg.configFile = {
      "git/config".source = "${configDir}/git/config";
      "git/ignore".source = "${configDir}/git/ignore";
    };

    zsh.rcFiles = [ "${configDir}/git/aliases.zsh" ];
}