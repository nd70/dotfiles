return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({ -- enable syntax highlighting
			highlight = { enable = true },
			indent = { enable = true },
			autopairs = { enable = true },
			autotag = { enable = true },

			ensure_installed = {
				"yaml",
				"markdown",
				"bash",
				"lua",
				"vim",
				"python",
				"go",
				"scala",
				"vimdoc",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<TAB>",
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
