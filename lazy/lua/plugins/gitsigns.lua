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
		{ "<leader>sB", "<cmd>Gitsigns blame<cr>" },
		{ "<leader>sp", "<cmd>Gitsigns preview_hunk<cr>" },
		{ "<leader>sd", "<cmd>Gitsigns toggle_deleted<cr>" },
		{ "<leader>dm", "<cmd>DiffviewOpen main..HEAD<cr>" },
		{ "<leader>dM", "<cmd>DiffviewClose<cr>" },
	},
	lazy = true,
}
