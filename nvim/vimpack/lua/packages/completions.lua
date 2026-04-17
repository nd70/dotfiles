local loaded = false

local function ensure_cmp()
	if loaded then
		return
	end

	vim.pack.add({
		"https://github.com/hrsh7th/nvim-cmp",
		"https://github.com/hrsh7th/cmp-nvim-lsp",
		"https://github.com/hrsh7th/cmp-buffer",
		"https://github.com/hrsh7th/cmp-path",
		"https://github.com/L3MON4D3/LuaSnip",
		"https://github.com/rafamadriz/friendly-snippets",
		"https://github.com/saadparwaiz1/cmp_luasnip",
		"https://github.com/onsails/lspkind.nvim",
	})

	local ok_cmp, cmp = pcall(require, "cmp")
	local ok_snip, luasnip = pcall(require, "luasnip")
	local ok_kind, lspkind = pcall(require, "lspkind")

	if not (ok_cmp and ok_snip and ok_kind) then
		return
	end

	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load({
		paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
	})

	vim.keymap.set({ "i", "s" }, "<C-l>", function()
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		end
	end, { silent = true, desc = "LuaSnip expand or jump" })

	vim.keymap.set({ "i", "s" }, "<C-h>", function()
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		end
	end, { silent = true, desc = "LuaSnip jump backward" })

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-a>"] = cmp.mapping.abort(),
			["<C-y>"] = cmp.mapping.confirm({ select = false }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
	})

	loaded = true
end

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = ensure_cmp,
})
