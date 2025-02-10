{ pkgs, inputs, ... }:

{
  home.username = "brady";
  home.homeDirectory = "/home/brady";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # home.packages = with pkgs; [
  #
  # ];

  # home.file = {
  #   ".config/nvim" = {
  #       source = ./dotfiles/nvim;
  #       recursive = true;
  #   };
  # };

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

  programs.nvf = {
	enable = true;
	settings = {

		vim = {
			theme = {
				enable = true;
				name = "tokyonight";
				style = "storm";
			};

			statusline.lualine.enable = true;
			telescope.enable = true;
			autocomplete.nvim-cmp.enable = true;
            filetree.neo-tree.enable = true;

			languages = {
				enableLSP = true;
				enableTreesitter = true;
				
				nix.enable = true;
			};
            lsp = {
                formatOnSave = true;
                null-ls.enable = true;
            };

			globals.mapleader = " ";

			options = {
				wrap = false;
				nu = true;
				relativenumber = true;
				tabstop = 4;
				softtabstop = 4;
				shiftwidth = 4;
				smartindent = true;
				swapfile = false;
				backup = false;
			};

			keymaps = [
                {
                    key = "J";
                    mode = ["v"];
                    action = ":m '>+1<CR>gv=gv";
                    silent = true;
                    desc = "Move highlighted line down";
                }
                {
                    key = "K";
                    mode = ["v"];
                    action = ":m '>-2<CR>gv=gv";
                    silent = true;
                    desc = "Move highlighted line up";
                }
                {
                    key = "J";
                    mode = ["n"];
                    action = "mzJ`z";
                    silent = true;
                    desc = "Remove newline";
                }
                {
                    key = "<C-j>";
                    mode = ["n"];
                    action = "<C-d>zz";
                    silent = true;
                    desc = "Move page down and center";
                }
                {
                    key = "<C-k>";
                    mode = ["n"];
                    action = "<C-u>zz";
                    silent = true;
                    desc = "Move page up and center";
                }
                {
                    key = "<leader>p";
                    mode = ["x"];
                    action = "\"_dP";
                    silent = true;
                    desc = "Paste without losing buffer";
                }
                {
                    key = "<leader>y";
                    mode = ["n" "v"];
                    action = "\"+y";
                    silent = true;
                    desc = "Copy to clipboard";
                }
                {
                    key = "<leader>d";
                    mode = ["n" "v"];
                    action = "\"_d";
                    silent = true;
                    desc = "Delete without losing buffer";
                }
                {
                    key = "<leader>pv";
                    mode = ["n"];
                    action = ":Neotree toggle current<CR>";
                    silent = true;
                    desc = "Open Neotree directory view";
                }
                {
                    key = "K";
                    mode = ["n"];
                    action = "vim.lsp.buf.hover";
                    silent = true;
                    desc = "Show lsp info";
                }
                {
                    key = "<leader>cc";
                    mode = ["n"];
                    action = "vim.lsp.buf.format";
                    silent = true;
                    desc = "Format code with null-ls";
                }
                {
                    key = "gd";
                    mode = ["n"];
                    action = "vim.lsp.buf.definition";
                    silent = true;
                    desc = "Go to definition";
                }
                {
                    key = "<leader>ca";
                    mode = ["n" "v"];
                    action = "vim.lsp.buf.code_action";
                    silent = true;
                    desc = "Show code actions";
                }
                {
                    key = "<leader>ff";
                    mode = ["n"];
                    action = "require('telescope.builtin').find_files";
                    silent = true;
                    desc = "Telescope find files";
                }
                {
                    key = "<leader>fs";
                    mode = ["n"];
                    action = "require('telescope.builtin').live_grep";
                    silent = true;
                    desc = "Telescope search by grep";
                }
			];
		};
	};
  };
  # ------------------------------------------------------------------

  # Zsh Setup --------------------------------------------------------
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

	initExtra = ''
		eval "$(zoxide init --cmd cd zsh)"
		eval "$(starship init zsh)"
	'';

    shellAliases = {
		update = "sudo nixos-rebuild switch --flake .";
		home-update = "sudo home-manager switch --flake .";
    };

    oh-my-zsh = {
		enable = true;
		plugins = [ "git" ];
    };
  };

  programs.starship = {
	enable = true;
	enableZshIntegration = true;
    settings = {
        format = ''
            $directory $git_branch $git_status $time
            $character
        '';
        directory = {
            style = "fg:#e3e5e5 bg:#769ff0";
            format = "[ $path ]($style)";
            truncation_length = 3;
            truncation_symbol = ".../";
        };
        git_branch = {
            style = "fg:#e3e5e5 bg:#769ff0";
            format = "[ on $branch ]($style)";
        };
        git_status = {
            style = "fg:#e3e5e5 bg:#769ff0";
            format = "[[$all_status$ahead_behind](bg:#394260)]($style)";
            staged = "[+\${count} ]($style)";
            modified = "[!\${count} ]($style)";
            deleted = "[-\${count} ]($style)";
            untracked = "[?\${count} ]($style)";
        };
        time = {
            style = "fg:#e3e5e5 bg:#769ff0";
            disabled = false;
            time_format = "%R";
            format = "[ $time ]($style)";
        };

    };
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
