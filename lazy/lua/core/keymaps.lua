local opts = { noremap = true, silent = true }

-- normal mode
vim.keymap.set("n", "<leader>q", "<ESC>:q<CR>", opts)
vim.keymap.set("n", "<leader>x", "<ESC>:qa!<CR>", opts)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>v", 'mn_v$h"+y`n', opts, { desc = "Yank line selection to system clipboard" })
vim.keymap.set("n", "<C-h>", "<C-w>W")
vim.keymap.set("n", "<C-l>", "<C-w>w")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", '<leader>"', "mnvipy`n")
vim.keymap.set("n", "<leader>'", 'mnvip_v$h"+y`n')
vim.keymap.set("n", "<leader>dc", [[:%s/\v(\s+)?# .*//gcc<CR>]], { desc = "Delete Python comments" })

-- terminal mode
vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>", opts)

-- insert mode
vim.keymap.set("i", "<C-c>", "<ESC>", opts)

-- visual mode
vim.keymap.set("v", "<leader>y", '"+y', opts)
