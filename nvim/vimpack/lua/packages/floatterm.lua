local loaded = false

local function ensure_floaterm()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/voldikss/vim-floaterm",
  })

  loaded = true
  return true
end

vim.keymap.set("n", "<C-f>", function()
  if not ensure_floaterm() then
    return
  end
  vim.cmd("FloatermNew --height=0.6 --width=0.8 --wintype=float --autoclose=2")
end, { desc = "Open Floaterm" })
