local loaded = false

local function ensure_flash()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/folke/flash.nvim",
  })

  local ok, flash = pcall(require, "flash")
  if not ok then
    return false
  end

  flash.setup({})
  loaded = true
  return true
end

vim.keymap.set({ "n", "x", "o" }, "s", function()
  if not ensure_flash() then
    return
  end
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  if not ensure_flash() then
    return
  end
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
  if not ensure_flash() then
    return
  end
  require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
  if not ensure_flash() then
    return
  end
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set("c", "<C-s>", function()
  if not ensure_flash() then
    return
  end
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })
