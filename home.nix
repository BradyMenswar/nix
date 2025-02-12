{
  pkgs,
  inputs,
  ...
}: {
  home.username = "brady";
  home.homeDirectory = "/home/brady";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  # colorScheme = inputs.nix-colors.colorSchemes.gruv-dark-medium;

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
  programs.kitty = {
    enable = true; # required for the default Hyprland config
    themeFile = "tokyo_night_storm";
  };
  programs.wofi.enable = true;
  programs.waybar = {
    enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];
    settings = {
      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";

      bind = [
        "$mod, F, exec, firefox"
        "$mod, S, exec, kitty"
        "$mod, D, exec, discord"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod, Q, killactive"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating,"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod, SPACE, exec, $menu"
        "SUPER_SHIFT, H, movewindow, l"
        "SUPER_SHIFT, J, movewindow, d"
        "SUPER_SHIFT, K, movewindow, u"
        "SUPER_SHIFT, L, movewindow, r"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      decoration = {
        rounding = 4;
        rounding_power = 4.0;
      };
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/brady/Pictures/Apartment Bedroom Office.jpg"
      ];
      wallpaper = [
        ", /home/brady/Pictures/Apartment Bedroom Office.jpg"
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
          enableFormat = true;
          nix.enable = true;
        };
        lsp = {
          enable = true;
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
            lua = true;
            silent = true;
            desc = "Show lsp info";
          }
          {
            key = "<leader>cc";
            mode = ["n"];
            action = "vim.lsp.buf.format";
            lua = true;
            desc = "Format code with null-ls";
          }
          {
            key = "gd";
            mode = ["n"];
            action = "vim.lsp.buf.definition";
            lua = true;
            silent = true;
            desc = "Go to definition";
          }
          {
            key = "<leader>ca";
            mode = ["n" "v"];
            action = "vim.lsp.buf.code_action";
            lua = true;
            silent = true;
            desc = "Show code actions";
          }
          {
            key = "<leader>ff";
            mode = ["n"];
            action = "require('telescope.builtin').find_files";
            lua = true;
            silent = true;
            desc = "Telescope find files";
          }
          {
            key = "<leader>fs";
            mode = ["n"];
            action = "require('telescope.builtin').live_grep";
            lua = true;
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
      rebuild = "sudo nixos-rebuild switch --flake .";
      rebuild-home = "home-manager switch --flake .";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
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
