return {
	"backdround/improved-ft.nvim",
	config = function()
		local ft = require("improved-ft")
		ft.setup({
			-- Maps default f/F/t/T/;/, keys.
			use_default_mappings = true,

			-- Ignores case of the given characters.
			ignore_char_case = false,

			-- Takes a last hop direction into account during repetition hops
			use_relative_repetition = true,

			-- Uses direction-relative offsets during repetition hops.
			use_relative_repetition_offsets = true,
		})
	end,
	lazy = false,
}
