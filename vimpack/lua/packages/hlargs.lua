vim.pack.add({
  "https://github.com/m-demare/hlargs.nvim",
})

local ok, hlargs = pcall(require, "hlargs")
if not ok then
  return
end

hlargs.setup()
