vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

local ok_mason, mason = pcall(require, "mason")
local ok_tool, mason_tool_installer = pcall(require, "mason-tool-installer")

if not (ok_mason and ok_tool) then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_tool_installer.setup({
  ensure_installed = {
    "stylua",
    "ruff",
  },
})
