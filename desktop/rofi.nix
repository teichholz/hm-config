{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [rofi];

	zsh.path = builtins.toString (config.variables.dotDir + /bin/rofi);
	zsh.env = {
		ROFI_THEMES = config.variables.dotDir + /config/rofi;
	};
}
