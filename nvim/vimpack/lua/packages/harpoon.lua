vim.pack.add({
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = "harpoon2",
  },
  "https://github.com/nvim-lua/plenary.nvim",
})

local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add to Harpoon" })

vim.keymap.set("n", "<leader>[", function()
  harpoon:list():select(1)
end, { desc = "Harpoon 1" })

vim.keymap.set("n", "<leader>{", function()
  harpoon:list():select(2)
end, { desc = "Harpoon 2" })

vim.keymap.set("n", "<leader>(", function()
  harpoon:list():select(3)
end, { desc = "Harpoon 3" })

vim.keymap.set("n", "<leader>&", function()
  harpoon:list():select(4)
end, { desc = "Harpoon 4" })

vim.keymap.set("n", "<leader>ht", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon menu" })
