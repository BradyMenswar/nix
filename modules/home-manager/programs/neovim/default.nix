{
  pkgs,
  config,
  ...
}: {
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
          name = "base16";
          base16-colors.base00 = "#${config.lib.stylix.colors.base00}";
          base16-colors.base01 = "#${config.lib.stylix.colors.base01}";
          base16-colors.base02 = "#${config.lib.stylix.colors.base02}";
          base16-colors.base03 = "#${config.lib.stylix.colors.base03}";
          base16-colors.base04 = "#${config.lib.stylix.colors.base04}";
          base16-colors.base05 = "#${config.lib.stylix.colors.base05}";
          base16-colors.base06 = "#${config.lib.stylix.colors.base06}";
          base16-colors.base07 = "#${config.lib.stylix.colors.base07}";
          base16-colors.base08 = "#${config.lib.stylix.colors.base08}";
          base16-colors.base09 = "#${config.lib.stylix.colors.base09}";
          base16-colors.base0A = "#${config.lib.stylix.colors.base0A}";
          base16-colors.base0B = "#${config.lib.stylix.colors.base0B}";
          base16-colors.base0C = "#${config.lib.stylix.colors.base0C}";
          base16-colors.base0D = "#${config.lib.stylix.colors.base0D}";
          base16-colors.base0E = "#${config.lib.stylix.colors.base0E}";
          base16-colors.base0F = "#${config.lib.stylix.colors.base0F}";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        filetree.neo-tree.enable = true;
        autocomplete.nvim-cmp = {
          enable = true;
          mappings.next = "<C-j>";
          mappings.previous = "<C-k>";
        };

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          enableFormat = true;
          nix.enable = true;
          ts.enable = true;
          tailwind.enable = true;
          css.enable = true;
          rust.enable = true;
          lua.enable = true;
          python = {
            enable = true;
            format.type = "black-and-isort";
          };
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          null-ls.enable = true;
        };

        globals.mapleader = " ";

        extraPlugins = with pkgs.vimPlugins; {
          nvim-surround = {
            package = nvim-surround;
            setup = "require('nvim-surround').setup {}";
          };
        };

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
            mode = ["n" "v"];
            action = "<C-d>zz";
            silent = true;
            desc = "Move page down and center";
          }
          {
            key = "<C-k>";
            mode = ["n" "v"];
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
            key = "<leader>t";
            mode = ["n"];
            action = ":tabnew<CR>";
            desc = "New tab";
          }
          {
            key = "<leader>1";
            mode = ["n"];
            action = "1gt";
            desc = "Switch to tab 1";
          }
          {
            key = "<leader>2";
            mode = ["n"];
            action = "2gt";
            desc = "Switch to tab 2";
          }
          {
            key = "<leader>3";
            mode = ["n"];
            action = "3gt";
            desc = "Switch to tab 3";
          }
          {
            key = "<leader>4";
            mode = ["n"];
            action = "4gt";
            desc = "Switch to tab 4";
          }
          {
            key = "<leader>5";
            mode = ["n"];
            action = "5gt";
            desc = "Switch to tab 5";
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
}
