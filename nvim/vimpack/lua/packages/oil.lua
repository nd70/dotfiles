vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, oil = pcall(require, "oil")
if not ok then
	return
end

oil.setup({
	default_file_explorer = true,
	keymaps = {
		["<C-l>"] = false,
		["<C-h>"] = false,
		["<C-x>"] = "actions.select_split",
		["<C-s>"] = false,
		["<C-v>"] = "actions.select_vsplit",
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
