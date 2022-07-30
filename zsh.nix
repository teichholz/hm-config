{ config, pkgs, lib,  ... }:


with lib;
{
  options = 
	{
		zsh.alias = mkOption {
			type = types.attrsOf (types.either types.str types.path);
			default = {};
		};


		zsh.path = mkOption { 
			type = types.envVar;
			default = ""; 
		};

		zsh.env = mkOption { 
			type = types.attrsOf (types.either types.str types.path);
			default = ""; 
		};

		zsh.rcInit = mkOption { 
			type = types.lines;
			default = ""; 
			description = ''
				Zsh lines to be written to $XDG_CONFIG_HOME/zsh/extra.zshrc and sourced by
				$XDG_CONFIG_HOME/zsh/.zshrc
				'';
		};

		zsh.envFiles = mkOption {
			type = types.listOf (types.either types.string types.path);
			default = [];
		};

		zsh.rcFiles = mkOption {
			type = types.listOf (types.either types.string types.path);
			default = [];
		};

	};

	config = {
		home.packages = with pkgs; [ 
			zsh dash fzf bat exa tree rsync parted fd ripgrep htop 
			tldr httpie ncdu jq glances pandoc nix-zsh-completions
			xdotool entr appimage-run feh fasd cargo nodePackages.npm nodejs
			direnv shellcheck python cmake binutils coreutils
		];

		zsh.path = builtins.toString (config.variables.configDir + /bin);

		zsh.alias = {
			dot = "home-manager switch --flake ${builtins.toString config.variables.home}/.config/nixpkgs#${config.home.username} --impure";
		};

		zsh.rcInit = "source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh";

		zsh.env = with config.systemd.user.sessionVariables; rec {
      ZDOTDIR   = "$XDG_CONFIG_HOME/zsh";
      ZSH_CACHE = "$XDG_CACHE_HOME/zsh";
      ZGEN_DIR  = "$XDG_DATA_HOME/zgenom";		
		};

		home.file.".zshenv".text = 
			let envVars = mapAttrsToList (n: v: "export ${n}=\"${v}\"") config.zsh.env; 
					envFiles = concatMapStrings (path: "source '${path}'\n") config.zsh.envFiles;
					aliasLines = mapAttrsToList (n: v: "alias ${n}=\"${v}\"") config.zsh.alias; 
			in ''
				## Environment
				${config.zsh.rcInit}
				${concatStringsSep "\n" envVars}
				## Aliases
				${concatStringsSep "\n" aliasLines}
				## Path 
				PATH=${config.zsh.path}:$PATH

				## Environment files
				${envFiles}

				## Personal config
				source $ZDOTDIR/.zshenv

				## Imperative config
				[[ -f "$HOME/.zshenv.extra" ]] && source "$HOME/.zshenv.extra"
				'';

		xdg.configFile = {
      # Write it recursively so other modules can write files to it
      "zsh" = { source = config.variables.configDir + /zsh; recursive = true; };

			"zsh/extra.zshrc".text = 
			  let rcFiles = concatMapStrings (path: "source '${path}'\n") config.zsh.rcFiles; in
			  ''
					# This file was autogenerated, do not edit it!
					${rcFiles}
				'';

    };

		home.activation = {
			cleanZgenom = lib.hm.dag.entryAfter ["writeBoundary"] ''
				$DRY_RUN_CMD rm -rf $ZSH_CACHE
				$DRY_RUN_CMD rm -fv $ZGEN_DIR/init.zsh{,.zwc}		
				$DRY_RUN_CMD rm -fv $ZDOTDIR/*.zwc		
				$DRY_RUN_CMD rm -fv $ZDOTDIR/.*.zwc		
			'';
		};
	};
}
