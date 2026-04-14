vim.pack.add({
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
})

local ok, todo_comments = pcall(require, "todo-comments")
if not ok then
  return
end

todo_comments.setup()

vim.keymap.set("n", "]t", function()
  todo_comments.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  todo_comments.jump_prev()
end, { desc = "Previous todo comment" })
