vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return
end

gitsigns.setup({})

vim.keymap.set("n", "<leader>j", function() gitsigns.next_hunk() end, { desc = "Next hunk" })
vim.keymap.set("n", "<leader>k", function() gitsigns.prev_hunk() end, { desc = "Prev hunk" })
vim.keymap.set("n", "<leader>sh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>uh", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>sb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
vim.keymap.set("n", "<leader>sB", "<cmd>Gitsigns blame<CR>", { desc = "Blame buffer" })
vim.keymap.set("n", "<leader>sp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>sd", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })
