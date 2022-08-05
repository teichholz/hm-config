{ pkgs, lib, ... }:

let theme = pkgs.dracula-theme;
    version = "3.0"; 
    gtk = pkgs.stdenv.mkDerivation {
      pname = "dracula-gtk";
      inherit version;
      src = pkgs.fetchFromGitHub {
        owner = "Dracula";
        repo = "gtk";
        rev = "v${version}";
        sha256 = "sha256-7DUT/DfvCSo9GiJzqhqvegNCARB0eGtPQ6oUQG/Uja0=";
      };
      installPhase = ''
        cp $src -r $out
      '';
    };
    gtk-icons = pkgs.stdenv.mkDerivation {
      pname = "dracula-gtk-icons";
      version = "1.0";
      src = pkgs.fetchzip {
        url = "https://github.com/dracula/gtk/files/5214870/Dracula.zip";
        sha256 = "sha256-rcSKlgI3bxdh4INdebijKElqbmAfTwO+oEt6M2D1ls0=";
      };
      installPhase = ''
        cp $src -r $out
      '';
    }; 
    gtk-cursor = pkgs.stdenv.mkDerivation {
      pname = "dracula-gtk-cursors";
      version = "1.0";
      src = pkgs.fetchzip {
        url = "https://github.com/dracula/gtk/releases/download/v3.0/Dracula-cursors.tar.xz";
        sha256 = "sha256-FCjsCGiaDqWisNe7cMgkKv1LLye6OLBOfhtRnkmXsnY=";
      };
      installPhase = ''
        cp $src -r $out
      '';
    }; 
in
{
	config = {

		home.packages = with pkgs;[ lxappearance ];

		gtk.enable = false;

		home.file.".themes/Dracula" = {
			source = gtk;
		};

		home.file.".icons/Dracula" = {
			source = gtk-icons;
		};

		home.file.".icons/Dracula-cursors" = {
			source = gtk-cursor;
		};

		/* xsession.enable = true; */
		/* xsession.initExtra = "feh --bg-scale --randomize ${builtins.toString ./wallpaper }/*"; */
	};
}
