return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6881/gitsigns.nvim",
		lazy = false,
		config = true,
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", silent = true, desc = "Git preview hunk" },
			{
				"<leader>gt",
				"<cmd>Gitsigns toggle_current_line_blame<CR>",
				silent = true,
				desc = "Git toggle current line blame",
			},
		},
	},
}
