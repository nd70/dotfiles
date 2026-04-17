require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "python", "bash" , "scala", "go"},
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autopairs = {
        enable = true,
    },
}
