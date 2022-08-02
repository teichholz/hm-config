{ config, pkgs,  ... }: 

let theme = "${pkgs.kitty-themes}/themes/Dracula.conf"; in
{
	home.packages = [ pkgs.kitty-themes ];

	xdg.configFile = with config.variables; {
		kitty = { 
			source = dotDir + /config/kitty;
			recursive = true; 
		};

		"kitty/theme.conf" = { 
			source = theme; 
		};
	};
}
