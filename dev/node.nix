{ pkgs, ... }: 

let npmDir = "$XDG_DATA_HOME/npm-packages"; in {
  
  zsh.rcInit = ''npm config set prefix ${npmDir}'';

  zsh.path = npmDir;

  zsh.env = {
    MANPATH = ''export MANPATH="$\{MANPATH-$(manpath)}:${npmDir}/share/man"'';
  };

	home.activation = {
		mkNodeCacheDir = lib.hm.dag.entryAfter ["writeBoundary"] 
			''$DRY_RUN_CMD [ ! -d "${npmDir}" ] && mkdir -p ${npmDir}'';
	};
}
