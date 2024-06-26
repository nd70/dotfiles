local ls = require("luasnip")
local types = require("luasnip.util.types")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/luasnip.lua<CR>")
