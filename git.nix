{ pkgs, lib, ... }:

{
    user.packages = with pkgs; [
      unstable.gitAndTools.gh
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
