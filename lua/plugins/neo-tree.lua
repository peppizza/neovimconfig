return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", silent = true, desc = "Reveal and jump to Neotree" },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				never_show = { ".git" },
			},
		},
	},
}
