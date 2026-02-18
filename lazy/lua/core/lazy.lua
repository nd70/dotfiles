-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
-- 	vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--filter=blob:none",
-- 		"https://github.com/folke/lazy.nvim.git",
-- 		"--branch=stable", -- latest stable release
-- 		lazypath,
-- 	})
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
--
-- require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
-- 	checker = {
-- 		enabled = true,
-- 		notify = false,
-- 	},
-- 	change_detection = {
-- 		notify = false,
-- 	},
-- })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Local development path: lazy will look for plugins under this folder when dev=true
local dev_path = vim.fn.expand("~/projects")

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lsp" },

	-- Local development plugin (axiom.nvim) — lazy will prefer ~/projects/axiom.nvim
	{
		"nd70/axiom.nvim",
		dev = true,
		-- optional: you can also set keys/config here for dev convenience
		keys = {
			{
				"<leader>xx",
				"<cmd>AxiomRunCell<cr>",
				mode = "n",
				noremap = true,
				silent = true,
				desc = "Run Axiom cell",
			},
		},
		config = function()
			require("axiom").setup({
				runner_socket = "/tmp/axiom.sock",
				image_render = "iterm",
				auto_run_on_save = "cell",
			})
		end,
	},
}, {
	dev = {
		-- where lazy looks for local plugins when you set dev = true
		path = dev_path,
		-- optional: patterns to match local plugins: default is {"*"}
		-- patterns = { "nd70/*" },
	},

	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
})
