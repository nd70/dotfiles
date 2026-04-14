vim.g.loaded_netrwPlugin = 1

local loaded = false

local function ensure_yazi()
  if loaded then
    return true
  end

  vim.pack.add({
    {
      src = "https://github.com/mikavilpas/yazi.nvim",
      version = "*",
    },
    "https://github.com/nvim-lua/plenary.nvim",
  })

  local ok, yazi = pcall(require, "yazi")
  if not ok then
    return false
  end

  yazi.setup({
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  })

  loaded = true
  return true
end

vim.keymap.set({ "n", "v" }, "<leader>-", function()
  if not ensure_yazi() then
    return
  end
  vim.cmd("Yazi")
end, { desc = "Open yazi at the current file" })

vim.keymap.set("n", "<leader>cw", function()
  if not ensure_yazi() then
    return
  end
  vim.cmd("Yazi cwd")
end, { desc = "Open yazi in current working directory" })

vim.keymap.set("n", "<C-Up>", function()
  if not ensure_yazi() then
    return
  end
  vim.cmd("Yazi toggle")
end, { desc = "Resume the last yazi session" })
