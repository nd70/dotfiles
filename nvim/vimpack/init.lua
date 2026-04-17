local data_site = vim.fn.stdpath("data") .. "/site"
vim.opt.packpath:prepend(data_site)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core config
require("core.options")
require("core.keymaps")

-- Theme early
require("packages.themes")

-- Core editing / UI
require("packages.comment")
require("packages.surround")
require("packages.flash")
require("packages.hlargs")
require("packages.yankassassin")
require("packages.lualine")
-- require("packages.noice")
-- require("packages.fine_cmdline")
require("packages.zen_mode")

-- Treesitter before plugins that use it
require("packages.treesitter")
require("packages.render_markdown")

-- Completion / LSP toolchain
require("packages.completions")
require("packages.mason")
require("packages.lsp")
require("packages.conform")
-- require("packages.copilot")

-- Git
require("packages.gitsigns")
require("packages.git_worktrees")
require("packages.lazygit")
require("packages.neogit")

-- Search / navigation / file managers
require("packages.telescope")
require("packages.oil")
require("packages.yazi")
require("packages.harpoon")
-- require("packages.trouble")
require("packages.todo")

-- Utilities
require("packages.clock")
require("packages.csvview")
require("packages.floatterm")
require("packages.global_marks")
