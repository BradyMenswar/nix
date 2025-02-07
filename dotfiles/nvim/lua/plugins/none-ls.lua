return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					extra_args = { "--config", vim.fn.expand(".prettierrc") },
					cwd = function(params)
						return vim.fn.getcwd()
					end,
				}),
				null_ls.builtins.formatting.black,
			},
		})
		vim.keymap.set("n", "<leader>cc", vim.lsp.buf.format, {})
	end,
}
