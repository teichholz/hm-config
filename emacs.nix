{ config, pkgs, lib, ... }: 

let emacsDir = builtins.toString (config.variables.home + /.emacs.d);
		binDir = emacsDir + "/bin";
		configDir = builtins.toString (config.variables.configHome + /.doom.d);
in {
	config.zsh.path = binDir;

	config.zsh.env = {
	 	DOOMDIR = configDir;
	};

	# Clone emacs config and doom if missing
	config.home.activation = {
		cloneDoomConfigIfMissing = lib.hm.dag.entryAfter ["writeBoundary"] ''
			$DRY_RUN_CMD [ ! -d "${configDir}" ] && git clone https://github.com/teichholz/doom-config ${configDir}
			'';
		cloneDoomIfMissing = lib.hm.dag.entryAfter ["writeBoundary" "cloneDoomConfigIfMissing"] ''
			$DRY_RUN_CMD [ ! -d "${emacsDir}" ] && git clone --depth 1 https://github.com/doomemacs/doomemacs ${emacsDir} && ${binDir}/doom install 
			'';
	};
}
