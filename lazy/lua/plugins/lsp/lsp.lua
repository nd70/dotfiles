return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig", -- ensure mason-lspconfig is available
	},
	config = function()
		local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
		if not mason_lspconfig_ok then
			vim.notify("mason-lspconfig not found; LSP auto-setup skipped", vim.log.levels.WARN)
			return
		end

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- LSP attach autocommands (buffer local mappings + format on save)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true, noremap = true }

				-- diagnostics and LSP keymaps (buffer-local)
				keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set(
					"n",
					"<leader>vd",
					":vsplit | lua vim.lsp.buf.definition()<CR>",
					{ desc = "Go to definition in vertical split", buffer = ev.buf }
				)
				keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

				-- Format on save for clients that support formatting
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client and client.supports_method and client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = ev.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 2000 })
						end,
					})
				end
			end,
		})

		-- capabilities from cmp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Diagnostic signs in sign column
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		-- diagnostic sign setup: modern (vim.diagnostic.config) with fallbacks
		local function setup_diagnostic_signs()
			local icons = {
				Error = " ",
				Warn = " ",
				Hint = "󰠠 ",
				Info = " ",
			}

			-- Prefer to configure via vim.diagnostic.config() (works on many versions)
			if vim.diagnostic and vim.diagnostic.config then
				-- map severities to icons (use diagnostic.severity constants)
				local text = {}
				text[vim.diagnostic.severity.ERROR] = icons.Error
				text[vim.diagnostic.severity.WARN] = icons.Warn
				text[vim.diagnostic.severity.HINT] = icons.Hint
				text[vim.diagnostic.severity.INFO] = icons.Info

				vim.diagnostic.config({
					virtual_text = true,
					underline = true,
					update_in_insert = false,
					severity_sort = true,
					float = { border = "rounded", source = "if_many" },
					-- inline sign definition (modern and broadly supported)
					signs = { text = text },
				})
				return
			end

			-- If vim.diagnostic.config isn't available, fall back to sign_define
			if vim.fn and vim.fn.sign_define then
				for kind, icon in pairs(icons) do
					local name = "DiagnosticSign" .. kind
					vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
				end
				return
			end

			-- Last-resort: notify user (very old or unusual Neovim)
			vim.notify("Unable to define diagnostic signs: no suitable API found", vim.log.levels.WARN)
		end

		setup_diagnostic_signs()

		-- mason-lspconfig setup (you can control ensure_installed / automatic_installation here)
		mason_lspconfig.setup({
			-- Example: list servers you want ensured installed (edit to your preference)
			ensure_installed = { "ruff", "pylsp", "lua_ls" },
			automatic_installation = true,
		})

		-- default config applied to most servers
		local default_config = {
			capabilities = capabilities,
		}

		-- helper to register and enable an LSP with a merged config
		local function register_and_enable(name, config)
			local merged = vim.tbl_deep_extend("force", {}, default_config, config or {})
			vim.lsp.config(name, merged)
			vim.lsp.enable(name)
		end

		-- Special-case servers with custom settings
		-- pylsp (keep pycodestyle adjustments)
		register_and_enable("pylsp", {
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore = { "E501", "W605", "E203", "W391", "W503" },
							maxLineLength = 90,
						},
					},
				},
			},
		})

		-- ruff (pass CLI args via init_options so diagnostics follow your preferences)
		register_and_enable("ruff", {
			init_options = {
				args = { "--line-length=120", "--ignore=E501,W605,E203,W391,W503" },
			},
		})

		-- lua_ls (recognize `vim` global and snippet behavior)
		register_and_enable("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		-- Register and enable all other installed servers reported by mason-lspconfig
		local installed = {}
		if type(mason_lspconfig.get_installed_servers) == "function" then
			installed = mason_lspconfig.get_installed_servers() or {}
		end

		-- If mason doesn't report installed servers (older/newer API differences), fall back to ensure_installed
		if #installed == 0 then
			local ok, cfg = pcall(require, "mason-lspconfig")
			if ok and cfg and cfg.settings and cfg.settings.ensure_installed then
				installed = cfg.settings.ensure_installed
			else
				-- last-resort fallback: servers from the earlier ensure_installed call above
				installed = { "pylsp", "ruff", "lua_ls", "gopls" }
			end
		end

		for _, name in ipairs(installed) do
			if name ~= "pylsp" and name ~= "ruff" and name ~= "lua_ls" then
				-- register default config and enable
				register_and_enable(name)
			end
		end
	end,
}
