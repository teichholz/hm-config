{ pkgs, lib, config, ... }:

with config.variables;
{
    home.packages = with pkgs; [
      docker docker-compose
    ];

	config.home.activation = {
		addUserToDockerGroupIfNotAlready = lib.hm.dag.entryAfter ["writeBoundary"] ''
      groups $USER | grep -q docker || usermod -aG docker $USER
		'';
	};
}
