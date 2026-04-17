return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			ts.install({
				"python",
				"lua",
				"go",
				"scala",
				"yaml",
				"markdown",
				"bash",
				"vim",
				"vimdoc",
			}):wait(300000)

			local function enable_treesitter(ev)
				local ft = vim.bo[ev.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft

				local ok = vim.treesitter.language.add(lang)
				if not ok then
					return
				end

				vim.treesitter.start(ev.buf, lang)
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "python", "lua", "go", "scala", "yaml", "markdown", "bash", "vim", "vimdoc" },
				callback = enable_treesitter,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = { enable = true, lookahead = true },
				move = { set_jumps = true },
			})

			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")

			local function map_obj(keys, query)
				vim.keymap.set({ "x", "o" }, keys, function()
					select.select_textobject(query, "textobjects")
				end)
			end

			map_obj("am", "@function.outer")
			map_obj("im", "@function.inner")
			map_obj("ac", "@class.outer")
			map_obj("ic", "@class.inner")
			map_obj("ai", "@conditional.outer")
			map_obj("ii", "@conditional.inner")
			map_obj("al", "@loop.outer")
			map_obj("il", "@loop.inner")

			vim.keymap.set({ "n", "x", "o" }, "]m", function()
				move.goto_next_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[m", function()
				move.goto_previous_start("@function.outer", "textobjects")
			end)
		end,
	},
}

-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		branch = "main",
-- 		lazy = false,
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			require("nvim-treesitter").setup({
-- 				install_dir = vim.fn.stdpath("data") .. "/site",
-- 			})
--
-- 			vim.api.nvim_create_autocmd("FileType", {
-- 				pattern = { "python", "lua", "go", "scala", "yaml", "markdown", "bash", "vim", "vimdoc" },
-- 				callback = function()
-- 					vim.treesitter.start()
-- 					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 				end,
-- 			})
-- 		end,
-- 	},
--
-- 	{
-- 		"nvim-treesitter/nvim-treesitter-textobjects",
-- 		branch = "main",
-- 		config = function()
-- 			require("nvim-treesitter-textobjects").setup({
-- 				select = { enable = true, lookahead = true },
-- 				move = { set_jumps = true },
-- 			})
--
-- 			local select = require("nvim-treesitter-textobjects.select")
-- 			local move = require("nvim-treesitter-textobjects.move")
--
-- 			local function map_obj(keys, query)
-- 				vim.keymap.set({ "x", "o" }, keys, function()
-- 					select.select_textobject(query, "textobjects")
-- 				end)
-- 			end
--
-- 			map_obj("am", "@function.outer")
-- 			map_obj("im", "@function.inner")
-- 			map_obj("ac", "@class.outer")
-- 			map_obj("ic", "@class.inner")
-- 			map_obj("ai", "@conditional.outer")
-- 			map_obj("ii", "@conditional.inner")
-- 			map_obj("al", "@loop.outer")
-- 			map_obj("il", "@loop.inner")
--
-- 			vim.keymap.set({ "n", "x", "o" }, "]m", function()
-- 				move.goto_next_start("@function.outer", "textobjects")
-- 			end)
-- 			vim.keymap.set({ "n", "x", "o" }, "[m", function()
-- 				move.goto_previous_start("@function.outer", "textobjects")
-- 			end)
-- 		end,
-- 	},
-- }
