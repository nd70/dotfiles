return {
	{
		"ggandor/leap.nvim",
		keys = {
			{
				"<C-s>",
				function()
					require("leap").leap({
						target_windows = require("leap.user").get_focusable_windows(),
					})
				end,
			},
		},
		lazy = true,
	},
}
