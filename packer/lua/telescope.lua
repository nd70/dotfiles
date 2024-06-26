local t = require("telescope")
-- local z_utils = require("telescope._extensions.zoxide.utils")

t.setup{
	defaults = {
		path_display={"smart"}
	}
}

-- zoxide
t.load_extension('zoxide')
t.load_extension("fzf")
t.load_extension("git_worktree")
