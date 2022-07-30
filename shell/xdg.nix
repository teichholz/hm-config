{ config, ... }:


let assocs = {
        "image/png" = [ "feh.desktop" ];
        "image/jpg" = [ "feh.desktop" ];
        "text/plain" = [ "neovim.desktop" ];
        "application/pdf" = [ "evince.desktop" ];
    }; in
{
	config = {
		### A tidy $HOME is a tidy mind
		xdg = {
			enable = true;
			userDirs = {
				enable = true;
				download = "$HOME/dl";
			};

			mime.enable = true;
			mimeApps.enable = true;
			mimeApps.defaultApplications = assocs;
			mimeApps.associations.added = assocs;
		};
	};
}
