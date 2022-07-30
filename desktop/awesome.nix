{ config, pkgs, lib, ... }: 

{
	imports = [ ./rofi.nix ];

	
	config = {

		home.packages = with pkgs; [rofi dunst];

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
