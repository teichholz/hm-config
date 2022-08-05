{ pkgs, lib, ... }:

let theme = pkgs.dracula-theme; in
{
	config = {

		home.packages = [ theme ];

		gtk.enable = true;

		gtk.cursorTheme = {
			package = theme;
			name = "Dracula-cursors";
			size = 16;
		};

		gtk.iconTheme = {
			package = theme;
			name = "Dracula-cursors";
		};

		gtk.theme = {
			package = theme;
			name = "Dracula";
		};

		home.file.".themes/Dracula" = {
			source = theme + /share/themes/Dracula;
			# recursive = true;
		};

		home.file.".icons/Dracula-cursors" = {
			source = theme + /share/icons/Dracula-cursors;
			# recursive = true;
		};

		/* xsession.enable = true; */
		/* xsession.initExtra = "feh --bg-scale --randomize ${builtins.toString ./wallpaper }/*"; */
	};
}
