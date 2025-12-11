return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<C-l>"] = false,
				["<C-h>"] = false,
				["<C-x>"] = "actions.select_split",
				["<C-s>"] = false,
				["<C-v>"] = "actions.select_vsplit",
			},
			-- view_options = {
			-- 	show_hidden = true,
			-- 	is_hidden_file = function(name)
			-- 		return vim.startswith(name, ".config")
			-- 	end,
			-- },
		})
	end,
	keys = {
		{ "-", "<CMD>Oil<CR>" },
	},
	lazy = true,
}
