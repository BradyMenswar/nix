{ config, pkgs, inputs, ... }:

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
	  package = inputs.hyprland.packages."${pkgs.system}".hyprland;
	  plugins = [
		inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
	  ];
	  settings = {
		"$mod" = "SUPER";
		bind = [
			"$mod, F, exec, firefox"
			"$mod, S, exec, kitty"
			"$mod, D, exec, discord"
			"$mod, H, movefocus, l"
			"$mod, J, movefocus, d"
			"$mod, K, movefocus, u"
			"$mod, L, movefocus, r"
			"$mod, Q, killactive"
			"SUPER_SHIFT, H, movewindow, l"
			"SUPER_SHIFT, J, movewindow, d"
			"SUPER_SHIFT, K, movewindow, u"
			"SUPER_SHIFT, L, movewindow, r"
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

	completionInit = ''
		zoxide init --cmd cd zsh
		starship init zsh
	'';

    shellAliases = {
		update = "sudo nixos-rebuild switch --flake .";
		home-update = "sudo home-manager switch --flake .";
    };

    oh-my-zsh = {
		enable = true;
		plugins = [ "git" ];
		theme = "robbyrussell";
    };
  };

  programs.starship = {
	enable = true;
	enableZshIntegration = true;
  };

  programs.zoxide = {
	enable = true;
	enableZshIntegration = true;
  };
  # ------------------------------------------------------------------

  home.sessionVariables = {
    # EDITOR = neovim;
  };

  programs.home-manager.enable = true;
}
