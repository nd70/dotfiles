local opts = {
	backup = false,
	cmdheight = 1,
	colorcolumn = "120",
	errorbells = false,
	expandtab = true,
	guicursor = "",
	hlsearch = false,
	incsearch = true,
	number = true,
	relativenumber = true,
	scrolloff = 8,
	shiftwidth = 4,
	signcolumn = "yes",
	smartindent = false,
	softtabstop = 4,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 4,
	termguicolors = true,
	textwidth = 120,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	updatetime = 50,
	wrap = false,
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
vim.g.netrw_buffsettings = "nu rnu"

vim.cmd([[
  augroup highlight_yank
  autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=50})
  augroup END
]])

-- set ruff directory
vim.env.RUFF_CONFIG = vim.fn.expand("~/.config/ruff/ruff.toml")
