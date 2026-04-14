vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

lualine.setup({})
