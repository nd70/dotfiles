local opts = { noremap = true, silent = true }

-- normal mode
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", opts)
vim.keymap.set("n", "<leader>q", "<ESC>:q<CR>", opts)
-- vim.keymap.set("n", "<leader>w", "<ESC>:w<CR>", opts)
vim.keymap.set("n", "<leader>x", "<ESC>:qa!<CR>", opts)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "X", "<cmd>! python %<CR>")
-- vim.keymap.set("n", "<leader>o", "<ESC>:noh<CR>")
-- vim.keymap.set("n", "<leader>T", "<cmd>vsplit | resize 33 | terminal<CR>")
vim.keymap.set("n", "<leader>T", "<cmd>vsplit | terminal<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>:cd ..<CR>")

-- vim.keymap.set("n", "}", "}j", opts)
-- vim.keymap.set("n", "{", "{{j", opts)
vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>", opts)
vim.keymap.set("n", "<leader>v", "mn_v$h\"+y`n", opts)
vim.keymap.set("n", "<leader>n", "mngdzt", opts)

-- split pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>W")
vim.keymap.set("n", "<C-l>", "<C-w>w")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- insert mode
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
vim.keymap.set("i", "<C-g>", "<C-o>A", opts)

-- visual mode
vim.keymap.set("v", "<leader>y", "\"+y", opts)

-- x-visual mode
vim.keymap.set("x", "<leader>p", "\"_dP", opts)

-- fugitive
-- vim.keymap.set("n", "gl", "<cmd>diffget //2<CR>")
-- vim.keymap.set("n", "gr", "<cmd>diffget //3<CR>")

-- conform
local cf = require("conform")
vim.keymap.set({ "n", "v" }, "<leader>cf", function() cf.format({ lsp_fallback = true, async = false, timeout_ms = 500 }) end)
-- vim.keymap.set({"n", "v"}, "<leader>cf", "<cmd>lua require('conform').format({lsp_fallback=true, async=false, timeout_ms=500})", opts)

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Floatterm
vim.keymap.set("n", "<leader>ft", "<cmd>:FloatermNew --height=0.6 --width=0.8 --wintype=float<cr>", opts)
vim.keymap.set("n", "<leader>fp", "<cmd>:FloatermNew python<cr>", opts)

-- goto preview
vim.keymap.set("n", "<leader>pd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
vim.keymap.set("n", "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
vim.keymap.set("n", "<leader>pc", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)

-- vim-argwrap
vim.keymap.set("n", "<leader>aw", "<cmd>ArgWrap<CR>", opts)

-- treejs
vim.keymap.set('n', '<leader>m', require('treesj').toggle)


-- obsidian
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", opts)
vim.keymap.set("n", "<leader>od", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", opts)

-- no-neck-pain
vim.keymap.set("n", "<leader>np", "<cmd>NoNeckPain<cr>", opts)

-- telescope
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.keymap.set("n", "<leader>tH", "<cmd>Telescope find_files hidden=true<CR>", opts)
vim.keymap.set("n", "<leader>tr", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.keymap.set("n", "<leader>th", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
vim.keymap.set("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
vim.keymap.set("n", "<leader>tF", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
vim.keymap.set("n", "<leader>to", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
vim.keymap.set("n", "<leader>tk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
vim.keymap.set("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
vim.keymap.set("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
vim.keymap.set("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", opts)
vim.keymap.set('n', '<leader>rf', function() require('telescope.builtin').lsp_references() end)

-- harpoon
local harpoon = require('harpoon')
harpoon:setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 10,
    }
})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-i>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>+", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>[", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>{", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>(", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>&", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>=", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)

-- LSP
vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ds", function() vim.lsp.buf.document_symbol() end)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
-- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

-- GitSigns
vim.keymap.set("n", "<leader>sp", "<cmd>Gitsigns preview_hunk<cr>", opts)
vim.keymap.set('n', "<leader>sm", "<cmd>Gitsigns blame_line<cr>", opts)
vim.keymap.set('n', "<leader>sb", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
vim.keymap.set('n', "<leader>sD", "<cmd>Gitsigns diffthis<cr>", opts)
vim.keymap.set('n', "<leader>sd", "<cmd>Gitsigns toggle_deleted<cr>", opts)
vim.keymap.set('n', "<leader>sj", "<cmd>Gitsigns next_hunk<cr>", opts)
vim.keymap.set('n', "<leader>sk", "<cmd>Gitsigns prev_hunk<cr>", opts)
vim.keymap.set('n', "<leader>sh", "<cmd>Gitsigns stage_hunk<cr>", opts)
vim.keymap.set('n', "<leader>su", "<cmd>Gitsigns undo_stage_hunk<cr>", opts)

-- Todo Comments
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Leap
-- search across all windows
vim.keymap.set('n', "<C-s>", function()
    local focusable_windows_on_tabpage = vim.tbl_filter(
        function(win) return vim.api.nvim_win_get_config(win).focusable end,
        vim.api.nvim_tabpage_list_wins(0)
    )
    require('leap').leap { target_windows = focusable_windows_on_tabpage }
end, opts)

vim.keymap.set("v", "x", "x", opts)

-- telescope-zoxide
vim.keymap.set("n", "<leader>z", require("telescope").extensions.zoxide.list)

-- -- Snippets
-- local ls = require("luasnip")
-- -- jump forward
-- vim.keymap.set({ "i", "s"}, "<c-k>", function()
--     if ls.expand_or_jumpable() then
--         ls.expand_or_jump()
--     end
-- end, { silent = true })
--
-- -- jump backwards
-- vim.keymap.set({ "i", "s"}, "<c-j>", function()
--     if ls.jumpable(-1) then
--         ls.jump(-1)
--     end
-- end, { silent = true })
--
-- vim.keymap.set("i", "<c-l>", function()
--     if ls.choice_active() then
--         ls.change_choice(1)
--     end
-- end)
--

-- Improved-ft
local ft = require("improved-ft")
local map = function(key, fn, description)
    vim.keymap.set({ "n", "x", "o" }, key, fn, {
        desc = description,
        expr = true,
    })
end

map("f", ft.hop_forward_to_char, "Hop forward to a given char")
map("F", ft.hop_backward_to_char, "Hop backward to a given char")

map("t", ft.hop_forward_to_pre_char, "Hop forward before a given char")
map("T", ft.hop_backward_to_pre_char, "Hop backward before a given char")

map(";", ft.repeat_forward, "Repeat hop forward to a last given char")
map(",", ft.repeat_backward, "Repeat hop backward to a last given char")

-- nvim-tree
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>")

-- git-worktree
vim.keymap.set("n", "<leader>wa", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    silent)
vim.keymap.set("n", "<leader>wo", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    silent)


-- global-note
local global_note = require("global-note")
global_note.setup()

vim.keymap.set("n", "<leader>gn", global_note.toggle_note, {
  desc = "Toggle global note",
})

-- reload and reset overrides
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/luasnip.lua<CR>")
vim.keymap.set("n", "s", "s", opts)
vim.keymap.set("n", "S", "S", opts)
