{ config, lib, pkgs, ... }:

let 
  inherit (lib) mkOption types;
in
{
  options = 
	{
		variables = mkOption {
			type = types.attrsOf types.path;
			default = { };
		};
	};

  config = {
		variables = rec {
		  home = /. + config.home.homeDirectory;
			configHome = home + /.config;
			dotDir = configHome + /nixpkgs;
			configDir = configHome + /dotfiles/config;
		};
	};
}
