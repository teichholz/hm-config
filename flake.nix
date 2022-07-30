{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
    in {
      homeConfigurations.tim = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = (basics ./home.nix) ++ [
					dev
        ];
				extraSpecialArgs = {  };
      };
      homeConfigurations.tim-lenovo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = (basics ./home.nix) ++[
					./awesome.nix
        ];
				extraSpecialArgs = {  };
      };
    };
}
