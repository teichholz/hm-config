{ pkgs, lib, ... }: 

{
 	fonts.fontconfig.enable = true; 
	home.packages = with pkgs; [ (nerdfonts.override { fonts = [ "Iosevka" "FiraCode" "Meslo" ]; }) ];
}
