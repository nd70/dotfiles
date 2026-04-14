vim.pack.add({
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

local ok, neogit = pcall(require, "neogit")
if ok then
  neogit.setup({})
end

vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>", { silent = true, noremap = true, desc = "Neogit" })
vim.keymap.set("n", "<leader>dm", "<cmd>DiffviewOpen main...HEAD<CR>", { silent = true, noremap = true, desc = "Diff main...HEAD" })
vim.keymap.set("n", "<leader>dM", "<cmd>DiffviewClose<CR>", { silent = true, noremap = true, desc = "Close Diffview" })
vim.keymap.set("n", "<leader>dt", "<cmd>DiffviewToggleFiles<CR>", { silent = true, noremap = true, desc = "Toggle Diffview files" })
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen main...HEAD<CR>", { silent = true, noremap = true, desc = "Open Diffview" })
