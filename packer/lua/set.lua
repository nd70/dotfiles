-- cursor
vim.opt.guicursor = ""

-- numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- netrw
vim.g.netrw_bufsettings = 'nu rnu'

-- auditory warnings are annoying
vim.opt.errorbells = false

-- sensible tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indent new lines if the previous line is
vim.opt.smartindent = true

-- one long line
vim.opt.wrap = false
vim.opt.textwidth = 88

-- i can edit what i want
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- dont highlight everything, but incrementaly search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- mo colors mo better
vim.opt.termguicolors = true

-- keep the cursor near-ish to the middle
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 20

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- avoid the lag if you repeat searches backwards
vim.g.mapleader = " "

-- colorcolumn for keeping code clean
vim.opt.colorcolumn = "88"

-- fast highlight yank
vim.cmd[[
  augroup highlight_yank
  autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=50})
  augroup END
]]

-- for fzf
vim.opt.runtimepath:append(',/usr/local/opt/fzf')

-- open vsplit on the right
vim.opt.splitright = true
vim.opt.splitbelow = true

-- for rhubarb
vim.g.github_enterprise_urls = {'https://git.target.com'}

-- for obsidian
vim.opt_local.conceallevel = 2
vim.opt.fillchars:append { diff = "╱" }
