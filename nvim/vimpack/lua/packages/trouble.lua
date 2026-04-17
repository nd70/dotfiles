local loaded = false

local function ensure_trouble()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/folke/trouble.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/todo-comments.nvim",
  })

  local ok, trouble = pcall(require, "trouble")
  if not ok then
    return false
  end

  trouble.setup({
    focus = true,
  })

  loaded = true
  return true
end

vim.api.nvim_create_user_command("Trouble", function(opts)
  if not ensure_trouble() then
    return
  end
  vim.cmd("Trouble " .. opts.args)
end, { nargs = "*" })

vim.keymap.set("n", "<leader>xw", function()
  if not ensure_trouble() then
    return
  end
  vim.cmd("Trouble diagnostics toggle")
end, { desc = "Open trouble workspace diagnostics" })

vim.keymap.set("n", "<leader>xd", function()
  if not ensure_trouble() then
    return
  end
  vim.cmd("Trouble diagnostics toggle filter.buf=0")
end, { desc = "Open trouble document diagnostics" })

vim.keymap.set("n", "<leader>xq", function()
  if not ensure_trouble() then
    return
  end
  vim.cmd("Trouble quickfix toggle")
end, { desc = "Open trouble quickfix list" })

vim.keymap.set("n", "<leader>xl", function()
  if not ensure_trouble() then
    return
  end
  vim.cmd("Trouble loclist toggle")
end, { desc = "Open trouble location list" })

vim.keymap.set("n", "<leader>xt", function()
  if not ensure_trouble() then
    return
  end
  vim.cmd("Trouble todo toggle")
end, { desc = "Open todos in trouble" })
