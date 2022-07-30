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
		  home = /home/tim;
			configHome = home + /.config;
			dotDir = configHome + /nixpkgs;
			configDir = configHome + /dotfiles/config;
		};
	};
}
