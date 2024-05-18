return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.ccls.setup({
				init_options = {
					compilationDatabaseDirectory = "build",
					index = {
						threads = 0,
					},
					clang = {
						excludeArgs = { "-frounding-math" },
					},
				},
				capabilities = capabilities,
			})
		end,
		keys = {
			{ "K", vim.lsp.buf.hover, desc = "LSP hover" },
			{ "gd", vim.lsp.buf.definition, desc = "Jump to definition" },
			{ "gr", vim.lsp.buf.references, desc = "Search for references" },
			{ "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, desc = "LSP code actions" },
		},
	},
}
