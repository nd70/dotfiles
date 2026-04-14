local loaded = false

local function ensure_csvview()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/hat0uma/csvview.nvim",
  })

  local ok, csvview = pcall(require, "csvview")
  if not ok then
    return false
  end

  csvview.setup({
    parser = { comments = { "#", "//" } },
    keymaps = {
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  })

  loaded = true
  return true
end

vim.api.nvim_create_user_command("CsvViewEnable", function(opts)
  if not ensure_csvview() then
    return
  end
  vim.cmd("CsvViewEnable " .. opts.args)
end, { nargs = "*" })

vim.api.nvim_create_user_command("CsvViewDisable", function(opts)
  if not ensure_csvview() then
    return
  end
  vim.cmd("CsvViewDisable " .. opts.args)
end, { nargs = "*" })

vim.api.nvim_create_user_command("CsvViewToggle", function(opts)
  if not ensure_csvview() then
    return
  end
  vim.cmd("CsvViewToggle " .. opts.args)
end, { nargs = "*" })

vim.keymap.set("n", "<leader>cv", function()
  if not ensure_csvview() then
    return
  end
  vim.cmd("CsvViewToggle delimiter=, display_mode=border header_lnum=1")
end, { desc = "Toggle CSV view" })
