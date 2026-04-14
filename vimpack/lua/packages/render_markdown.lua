vim.pack.add({
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, render_markdown = pcall(require, "render-markdown")
if not ok then
  return
end

render_markdown.setup({})
