local loaded = false

local function ensure_clock()
  if loaded then
    return true
  end

  vim.pack.add({
    "https://github.com/nd70/clock.nvim",
  })

  local ok, clock = pcall(require, "clock")
  if not ok then
    return false
  end

  clock.setup({
    map = false,
    fg = "#7CFF57",
    shadow_fg = "#003300",
    winblend = 0,
    shadow_winblend = 5,
    scale = 1,
    padding = 1,
    gradient = {
      from = "#17A1D4",
      to = "#F5A623",
    },
  })

  loaded = true
  return true
end

vim.api.nvim_create_user_command("ClockToggle", function()
  if not ensure_clock() then
    return
  end
  require("clock").toggle()
end, {})

vim.keymap.set("n", "<leader>ck", function()
  if not ensure_clock() then
    return
  end
  require("clock").toggle()
end, { desc = "Toggle large floating clock" })
