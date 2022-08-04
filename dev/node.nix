{ pkgs, lib, ... }: 

let npmDir = "$HOME/.cache/share/npm-packages"; in {
  
  /* zsh.rcInit = '' */
  /*   command -v npm >/dev/null 2>&1 && npm config set prefix ${npmDir} */
  /* ''; */

  zsh.path = npmDir + "/bin";

  zsh.env = {
    MANPATH = ''''${MANPATH-$(manpath)}:${npmDir}/share/man'';
    NPM_CONFIG_PREFIX="${npmDir}";
  };

	home.activation = {
		mkNodeCacheDir = lib.hm.dag.entryAfter ["writeBoundary"] 
			''$DRY_RUN_CMD [ ! -d "${npmDir}" ] && mkdir -p ${npmDir}'';
	};
}
