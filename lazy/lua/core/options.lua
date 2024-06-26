local opts = {
	guicursor = "",
	number = true,
	relativenumber = true,
	errorbells = false,
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	expandtab = true,
	smartindent = false,
	wrap = false,
	textwidth = 88,
	swapfile = false,
	backup = false,
	undofile = true,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	hlsearch = false,
	incsearch = true,
	termguicolors = true,
	scrolloff = 8,
	signcolumn = "yes",
	cmdheight = 1,
	updatetime = 50,
	colorcolumn = "88",
	splitright = true,
	splitbelow = true,
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
