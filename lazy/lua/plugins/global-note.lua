return {
	"backdround/global-note.nvim",
	config = function()
		require("global-note"):setup()
	end,

	keys = {
		{
			"<leader>gn",
			function()
				local gnote = require("global-note")
				gnote.toggle_note()
			end,
		},
	},
	lazy = true,
}
