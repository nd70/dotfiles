vim.pack.add({
  "https://github.com/svban/YankAssassin.nvim",
})

local ok, yank_assassin = pcall(require, "YankAssassin")
if not ok then
  return
end

yank_assassin.setup({
  auto_normal = true,
  auto_visual = true,
})
