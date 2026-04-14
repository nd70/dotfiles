local loaded = false

local function ensure_lazygit()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/kdheepak/lazygit.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
  })

  loaded = true
  return true
end

for _, cmd_name in ipairs({
  "LazyGit",
  "LazyGitConfig",
  "LazyGitCurrentFile",
  "LazyGitFilter",
  "LazyGitFilterCurrentFile",
}) do
  vim.api.nvim_create_user_command(cmd_name, function(opts)
    if not ensure_lazygit() then
      return
    end
    vim.cmd(cmd_name .. (opts.args ~= "" and (" " .. opts.args) or ""))
  end, { nargs = "*" })
end

vim.keymap.set("n", "<leader>lg", function()
  if not ensure_lazygit() then
    return
  end
  vim.cmd("LazyGit")
end, { desc = "LazyGit" })
