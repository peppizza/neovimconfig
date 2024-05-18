return {
  {
    "tpope/vim-fugitive"
  },
	{
		"lewis6881/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {silent = true})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {silent = true})
		end,
	},
}
