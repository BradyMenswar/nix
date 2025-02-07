return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.angularls.setup({
			capabilities = capabilities,
		})
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
		lspconfig.emmet_language_server.setup({
			capabilities = capabilities,
		})
		lspconfig.eslint.setup({
			capabilities = capabilities,
		})
		lspconfig.rust_analyzer.setup({
			-- capabilities = capabilities,
			-- check = {
			-- 	command = "clippy",
			-- },
			-- diagnostics = {
			-- 	enable = true,
			-- },
			-- cmd = {
			-- 	"rustup",
			-- 	"run",
			-- 	"stable",
			-- 	"rust-analyzer",
			-- },
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
					diagnostics = {
						enable = true,
					},
				},
			},
		})
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = "*.njk",
			command = "set filetype=html",
		})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
