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

		home.file.".themes" = {
			source = theme + /share/themes;
			recursive = true;
		};

		home.file.".icons" = {
			source = theme + /share/icons;
			recursive = true;
		};

		/* xsession.enable = true; */
		/* xsession.initExtra = "feh --bg-scale --randomize ${builtins.toString ./wallpaper }/*"; */
	};
}
