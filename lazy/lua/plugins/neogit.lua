return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = true,
	lazy = false,
	keys = {
		{ "<leader>ng", "<cmd>Neogit<cr>", { silent = true, noremap = true } },
		{ "<leader>dm", "<cmd>DiffviewOpen main...HEAD<cr>", { silent = true, noremap = true } },
		{ "<leader>dM", "<cmd>DiffviewClose<cr>", { silent = true, noremap = true } },
		{ "<leader>dt", "<cmd>DiffviewToggleFiles<cr>", { silent = true, noremap = true } },
		{ "<leader>do", "<cmd>DiffviewOpen main...HEAD<cr>", { silent = true, noremap = true } },
	},
}
