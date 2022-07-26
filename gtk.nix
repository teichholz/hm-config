{ pkgs, lib, ... }:

let theme = pkgs.dracula-theme; in
{
	config = {

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
			source = /home/tim/.nix-profile/share/themes;
			recursive = true;
		};

		home.file.".icons" = {
			source = /home/tim/.nix-profile/share/icons;
			recursive = true;
		};
	};
}
