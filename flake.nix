{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nur.overlay ];
      };
			lib = pkgs.lib;
			basics = home: [
				 home
				./variables.nix
				./fonts.nix
				./gtk.nix
				./xdg.nix
				./kitty.nix
				./zsh.nix
				./nvim.nix
				./emacs.nix
				./tmux.nix
				./git.nix
			];
			dev = [
				./dev/nix.nix
				./dev/python.nix
			];
			writing = [
			  ./emacs.nix
			];
    in {
      homeConfigurations.tim = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
					./home.nix
					./variables.nix
					./desktop/fonts.nix
					./desktop/gtk.nix
					./shell/xdg.nix
					./desktop/kitty.nix
					./shell/zsh.nix
					./editor/nvim.nix
					./shell/tmux.nix
					./shell/git.nix
					./editor/emacs.nix
					./dev/node.nix
        ];
				extraSpecialArgs = {  };
      };

      homeConfigurations.tim_work = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
					./home_work.nix
					./variables.nix
					./desktop/fonts.nix
					./desktop/gtk.nix
					./shell/xdg.nix
					./desktop/kitty.nix
					./shell/zsh.nix
					./editor/nvim.nix
					./shell/git.nix
          {
            zsh.rcInit = ''source $HOME/.nix-profile/etc/profile.d/nix.sh;'';
	    zsh.env = {
		TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo"; 
	    };
          }
        ];
				extraSpecialArgs = {  };
      };
    };
}
