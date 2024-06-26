local opts = { noremap = true, silent = true }

-- normal mode
vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", opts)
vim.keymap.set("n", "<leader>q", "<ESC>:q<CR>", opts)
vim.keymap.set("n", "<leader>x", "<ESC>:qa!<CR>", opts)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>T", "<cmd>vsplit | terminal<CR>")
vim.keymap.set("n", "<leader>v", 'mn_v$h"+y`n', opts)
vim.keymap.set("n", "<leader>n", "mngdzt", opts)
vim.keymap.set("n", "<C-h>", "<C-w>W")
vim.keymap.set("n", "<C-l>", "<C-w>w")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- terminal mode
vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>", opts)

-- insert mode
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
vim.keymap.set("i", "<C-g>", "<C-o>A", opts)

-- visual mode
vim.keymap.set("v", "<leader>y", '"+y', opts)

-- x-visual mode
vim.keymap.set("x", "<leader>p", '"_dP', opts)
