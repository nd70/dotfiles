local loaded = false

local function ensure_zen_mode()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/folke/zen-mode.nvim",
  })

  local ok, zen_mode = pcall(require, "zen-mode")
  if not ok then
    return false
  end

  zen_mode.setup({
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {},
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = false },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      todo = { enabled = false },
    },
  })

  loaded = true
  return true
end

vim.keymap.set("n", "<leader>z", function()
  if not ensure_zen_mode() then
    return
  end
  vim.cmd("ZenMode")
end, { desc = "Toggle Zen Mode" })
