return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",

		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		extensions = {
			"ThePrimeagen/git-worktree.nvim",
		},

		keys = {
			{
				"<leader>tf",
				"<cmd>Telescope find_files<cr>",
				desc = "find files",
			},
			{
				"<leader>ts",
				"<cmd>Telescope grep_string<cr>",
				desc = "grep string",
			},
			{
				"<leader>tS",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find({
						default_text = vim.fn.expand("<cword>"),
					})
				end,
				desc = "Search word in current buffer",
			},
			{
				"<leader>tc",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "grep string",
			},
			{
				"<leader>tg",
				"<cmd>Telescope live_grep<cr>",
				desc = "live grep",
			},
			{
				"<leader>tr",
				"<cmd>Telescope lsp_references<cr>",
				desc = "lsp references",
			},
			{
				"<leader>gs",
				"<cmd>Telescope git_status<cr>",
				desc = "git status",
			},
			{
				"<leader>gc",
				"<cmd>Telescope git_commits<cr>",
				desc = "git commits",
			},
			{
				"<leader>gb",
				"<cmd>Telescope git_bcommits<cr>",
				desc = "git buffer commits",
			},
			{ "<leader>wa", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>" },
			{ "<leader>wo", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>" },
			{
				"<leader>ws",
				function()
					local branch = vim.fn.input("Switch to branch: ")
					require("git-worktree").switch_worktree(branch)
				end,
			},
			{
				"<leader>wd",
				function()
					local branch = vim.fn.input("Delete branch: ")
					require("git-worktree").delete_worktree(branch)
				end,
			},
			{
				"<leader>wc",
				function()
					local feature = vim.fn.input("New branch: ")
					local branch = vim.fn.input("Pull from: ")
					require("git-worktree").create_worktree(feature, branch, "origin")
				end,
			},
		},

		lazy = false,
	},
}
