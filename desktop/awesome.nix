{ config, pkgs, lib, ... }: 

{
	imports = [ ./rofi.nix ];
	
	config = {

		home.packages = with pkgs; [ 
			acpi acpica-tools # system tools i.e battery
			lxappearance # MAYBE DELETE appearance tool for gtk3
			gpick # colorpicker
			ffmpeg # video converter
			inotify-tools # notification
			upower # battery monitor tool
			polkit_gnome # policiy toolkit
			redshift # reduces blue in monitorscreen in the evening
			blueman # bluetooth manager
			pipewire
			pamixer # audio mixer
			brightnessctl
			feh
			maim # screenshot tool
			mpv mpd mpc-cli mpdris2 ncmpcpp playerctl # music
			python39Packages.mutagen
			
			## fonts
			roboto
			material-design-icons
		];

		# install icomoon font
		home.file.".local/share/fonts/icomoon" = {
			source = ./fonts/icomoon;
			recursive = true;
		};

		services.mpd = {
			enable = true;
		};

		services.picom = {
			enable = true;
			fade = true;
			fadeDelta = 1;
			fadeSteps = [ 0.01 0.012 ];
			shadow = true;
			shadowOffsets = [ (-10) (-10) ];
			shadowOpacity = 0.22;
			# activeOpacity = "1.00";
			# inactiveOpacity = "0.92";
			settings = {
				corner-radius = 0.5;
				shadow-radius = 12;
				blur-background = true;
				blur-background-frame = true;
				blur-background-fixed = true;
				blur-kern = "7x7box";
				blur-strength = 320;
			};
		};
	};
}
