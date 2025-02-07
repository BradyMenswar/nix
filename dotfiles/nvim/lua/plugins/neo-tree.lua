return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = false, -- This will find and focus the file in the active buffer every time
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},
		})
		vim.keymap.set("n", "<leader>pv", ":Neotree toggle current<CR>", {})
		-- vim.keymap.set("n", "<leader>pT", ":Neotree filesystem close right<CR>", {})
	end,
}
