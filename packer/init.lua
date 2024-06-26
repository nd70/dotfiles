vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({ view = { relativenumber = true, adaptive_size = false } })
vim.cmd('hi NvimTreeNormal guibg=NONE')


-- OR setup with some options
-- require("nvim-tree").setup({
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })

require('packer-plugins')
require('sumneko')
require('lsp')
require('nvim-cmp')
require('set')
require('lspconfig').ruff_lsp.setup {
    init_options = {
        settings = {
            args = {},
        }
    }
}
require('color')
require('comment')
require('remap')
require('treesitter')
require('status')
require('autopairs')
require('luasnip')
require('telescope')
require('plenary')
require('harpoon')
require('git-worktree')
require('leap').add_default_mappings()
require('limelight')
require('hlargs').setup()
require('goto')
require('conform')
require('vim-argwrap')
require('improved-ft')
require('todo-comments').setup()
require('global-note')
require('lualine').setup()
require('obsidian')
require('telepath')
require('no-neck-pain')
require('treejs')
require('neogit').setup()
