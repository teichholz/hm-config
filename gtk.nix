{ pkgs, lib, ... }:

let theme = pkgs.dracula-theme; in
{
	config = {
		/* services.picom = { */
		/* 	enable = true; */
		/* 	fade = true; */
		/* 	fadeDelta = 1; */
		/* 	fadeSteps = [ 0.01 0.012 ]; */
		/* 	shadow = true; */
		/* 	shadowOffsets = [ (-10) (-10) ]; */
		/* 	shadowOpacity = 0.22; */
		/* 	# activeOpacity = "1.00"; */
		/* 	# inactiveOpacity = "0.92"; */
		/* 	settings = { */
		/* 		corner-radius = 0.5; */
		/* 		shadow-radius = 12; */
		/* 		blur-background = true; */
		/* 		blur-background-frame = true; */
		/* 		blur-background-fixed = true; */
		/* 		blur-kern = "7x7box"; */
		/* 		blur-strength = 320; */
		/* 	}; */
		/* }; */

		home.packages = [ theme pkgs.feh ];

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

		xsession.enable = true;
		xsession.initExtra = "feh --bg-scale --randomize ${builtins.toString ./wallpaper }/*";
	};
}
