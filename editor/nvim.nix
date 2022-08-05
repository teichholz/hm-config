{ config, pkgs, lib, ... }: 

let nvimDir = builtins.toString (config.variables.configHome + /nvim); in {

    home.packages = [ pkgs.neovim ];

	zsh.env = {
		EDITOR="nvim";
	};

	# Clone nvim repo if it does not exist
	home.activation = {
		cloneNvimIfMissing = lib.hm.dag.entryAfter ["writeBoundary"] ''
			$DRY_RUN_CMD [ ! -d "${nvimDir}" ] && git clone https://github.com/teichholz/nvim-conf ${nvimDir}
			'';
	};
}
