return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("harpoon"):setup()
		end,

		keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
			},
			{
				"<leader>[",
				function()
					require("harpoon"):list():select(1)
				end,
			},
			{
				"<leader>{",
				function()
					require("harpoon"):list():select(2)
				end,
			},
			{
				"<leader>(",
				function()
					require("harpoon"):list():select(3)
				end,
			},
			{
				"<leader>ht",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
			},
		},
		lazy = true,
	},
}
