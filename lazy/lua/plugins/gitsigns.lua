return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({})
	end,
	keys = {
		{ "<leader>j", "<cmd>Gitsigns next_hunk<cr>" },
		{ "<leader>k", "<cmd>Gitsigns prev_hunk<cr>" },
		{ "<leader>sh", "<cmd>Gitsigns stage_hunk<cr>" },
		{ "<leader>uh", "<cmd>Gitsigns undo_stage_hunk<cr>" },
		{ "<leader>sb", "<cmd>Gitsigns blame_line<cr>" },
		{ "<leader>sp", "<cmd>Gitsigns preview_line<cr>" },
		{ "<leader>sd", "<cmd>Gitsigns toggle_deleted<cr>" },
	},
	lazy = true,
}
