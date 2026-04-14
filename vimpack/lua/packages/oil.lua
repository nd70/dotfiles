local loaded = false

local function ensure_oil()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
  })

  local ok, oil = pcall(require, "oil")
  if not ok then
    return false
  end

  oil.setup({
    keymaps = {
      ["<C-l>"] = false,
      ["<C-h>"] = false,
      ["<C-x>"] = "actions.select_split",
      ["<C-s>"] = false,
      ["<C-v>"] = "actions.select_vsplit",
    },
  })

  loaded = true
  return true
end

vim.keymap.set("n", "-", function()
  if not ensure_oil() then
    return
  end
  vim.cmd("Oil")
end, { desc = "Open Oil" })
