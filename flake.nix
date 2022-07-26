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
    in {
      homeConfigurations.tim = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
					./variables.nix
					./fonts.nix
					./gtk.nix
					./xdg.nix
					./kitty.nix
					./zsh.nix
					./tmux.nix
					./nvim.nix
					./emacs.nix
					./dev/nix.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
				extraSpecialArgs = {  };
      };
    };
}
