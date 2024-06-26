return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true, noremap = true }

				-- set keybinds
				keymap.set("n", "<space>e", vim.diagnostic.open_float)
				keymap.set("n", "[d", vim.diagnostic.goto_prev)
				keymap.set("n", "]d", vim.diagnostic.goto_next)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["pylsp"] = function()
				lspconfig["pylsp"].setup({
					settings = {
						pylsp = {
							plugins = {
								pycodestyle = {
									ignore = { "E501", "W503", "W504", "W605", "E203" },
									maxLineLength = 88,
								},
							},
						},
					},
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
