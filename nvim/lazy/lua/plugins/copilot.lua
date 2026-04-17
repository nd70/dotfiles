return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.g.copilot_no_tab_map = true

		vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>(copilot-next)", { silent = true })
		vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>(copilot-previous)", { silent = true })
		vim.api.nvim_set_keymap("i", "<C-z>", "<Plug>(copilot-accept-word)", { silent = true })
	end,
}
