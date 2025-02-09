{ config, pkgs, ... }:

{
  home.username = "brady";
  home.homeDirectory = "/home/brady";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
	lua
  ];

  home.file = {
    ".config/nvim" = {
        source = ./dotfiles/nvim;
        recursive = true;
    };
  };
  # Hyprland Setup ---------------------------------------------------
  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland = {
	  enable = true;
	  settings = {
		"$mod" = "SUPER";
		bind = [
			"$mod, F, exec, firefox"
		];
	  };
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
  # ------------------------------------------------------------------

  # Neovim Setup -----------------------------------------------------
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  # ------------------------------------------------------------------

  # Zsh Setup --------------------------------------------------------
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
		update = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
		enable = true;
		plugins = [ "git" ];
		theme = "robbyrussell";
    };
  };
  # ------------------------------------------------------------------

  home.sessionVariables = {
    # EDITOR = neovim;
  };

  programs.home-manager.enable = true;
}
