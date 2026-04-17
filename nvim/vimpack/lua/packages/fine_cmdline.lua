vim.pack.add({
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/VonHeikemen/fine-cmdline.nvim' },
})

vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, desc = 'Fine cmdline' })
