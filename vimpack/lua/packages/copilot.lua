vim.pack.add({
  "https://github.com/github/copilot.vim",
})

vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)", { silent = true })
vim.keymap.set("i", "<C-p>", "<Plug>(copilot-previous)", { silent = true })
vim.keymap.set("i", "<C-z>", "<Plug>(copilot-accept-word)", { silent = true })
