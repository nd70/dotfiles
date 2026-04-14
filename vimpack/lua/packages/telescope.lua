vim.pack.add({
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    version = "*",
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/ThePrimeagen/git-worktree.nvim",
})

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup({})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "git_worktree")

vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>ts", "<cmd>Telescope grep_string<CR>", { desc = "Grep string" })
vim.keymap.set("n", "<leader>tS", function()
  require("telescope.builtin").current_buffer_fuzzy_find({
    default_text = vim.fn.expand("<cword>"),
  })
end, { desc = "Search word in current buffer" })
vim.keymap.set("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Current buffer fuzzy find" })
vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>tr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP references" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_bcommits<CR>", { desc = "Git buffer commits" })

vim.keymap.set("n", "<leader>wa", function()
  telescope.extensions.git_worktree.create_git_worktree()
end, { desc = "Create git worktree" })

vim.keymap.set("n", "<leader>wo", function()
  telescope.extensions.git_worktree.git_worktrees()
end, { desc = "Open git worktrees" })

vim.keymap.set("n", "<leader>ws", function()
  local branch = vim.fn.input("Switch to branch: ")
  require("git-worktree").switch_worktree(branch)
end, { desc = "Switch worktree" })

vim.keymap.set("n", "<leader>wd", function()
  local branch = vim.fn.input("Delete branch: ")
  require("git-worktree").delete_worktree(branch)
end, { desc = "Delete worktree" })

vim.keymap.set("n", "<leader>wc", function()
  local feature = vim.fn.input("New branch: ")
  local branch = vim.fn.input("Pull from: ")
  require("git-worktree").create_worktree(feature, branch, "origin")
end, { desc = "Create worktree" })
