vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/williamboman/mason-lspconfig.nvim",
})

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  vim.notify("mason-lspconfig not found; LSP auto-setup skipped", vim.log.levels.WARN)
  return
end

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_ok then
  vim.notify("cmp-nvim-lsp not found; LSP capabilities incomplete", vim.log.levels.WARN)
  return
end

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true, noremap = true }

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

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 2000 })
        end,
      })
    end
  end,
})

local capabilities = cmp_nvim_lsp.default_capabilities()

local function setup_diagnostic_signs()
  local icons = {
    Error = " ",
    Warn = " ",
    Hint = "󰠠 ",
    Info = " ",
  }

  if vim.diagnostic and vim.diagnostic.config then
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
      signs = { text = text },
    })
    return
  end

  if vim.fn and vim.fn.sign_define then
    for kind, icon in pairs(icons) do
      local name = "DiagnosticSign" .. kind
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    return
  end

  vim.notify("Unable to define diagnostic signs: no suitable API found", vim.log.levels.WARN)
end

setup_diagnostic_signs()

mason_lspconfig.setup({
  ensure_installed = { "ruff", "pylsp", "lua_ls" },
  automatic_installation = true,
})

local default_config = {
  capabilities = capabilities,
}

local function register_and_enable(name, config)
  local merged = vim.tbl_deep_extend("force", {}, default_config, config or {})
  vim.lsp.config(name, merged)
  vim.lsp.enable(name)
end

register_and_enable("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E501", "W605", "E203", "W391", "W503", "PLC0415" },
          maxLineLength = 90,
        },
      },
    },
  },
})

register_and_enable("ruff", {
  init_options = {
    args = { "--line-length=120", "--ignore=E501,W605,E203,W391,W503,PLC0415" },
  },
})

register_and_enable("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "describe", "it", "assert", "are" } },
      completion = { callSnippet = "Replace" },
    },
  },
})

local installed = {}
if type(mason_lspconfig.get_installed_servers) == "function" then
  installed = mason_lspconfig.get_installed_servers() or {}
end

if #installed == 0 then
  installed = { "pylsp", "ruff", "lua_ls", "gopls" }
end

for _, name in ipairs(installed) do
  if name ~= "pylsp" and name ~= "ruff" and name ~= "lua_ls" then
    register_and_enable(name)
  end
end
