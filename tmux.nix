{ config, pkgs, lib, ... }: 

with config.variables;
with lib; 
{
	options = {
		tmux.rcFiles = mkOption { 
			type = types.listOf (types.either types.str types.path) ;
			default = [];
		};
	};

	config = {
		home.packages = [ pkgs.tmux ];

		tmux.rcFiles = [ (configDir + /tmux/theme.conf) ];

		xdg.configFile = {
			"tmux" = { source = configDir + /tmux; recursive = true; };

			"tmux/extraInit" = {
				text = ''
				#!/usr/bin/env bash
				# This file is auto-generated by nixos, don't edit by hand!
				${concatMapStrings (path: "tmux source-file '${path}'\n") config.tmux.rcFiles}
				tmux run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/copycat.tmux
				tmux run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix_highlight.tmux
				tmux run-shell ${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
				tmux run-shell '${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux'
					'';
				executable = true;
			};
		};

		zsh.env = {
			TMUX_HOME = "$XDG_CONFIG_HOME/tmux";
		};
	};
}
