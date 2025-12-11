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
	},
}
