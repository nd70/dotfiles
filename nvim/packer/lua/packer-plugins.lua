-- only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- colorscheme
    -- use 'sainnhe/gruvbox-material'
    -- use { "rose-pine/neovim" }
    -- use { "catppuccin/nvim", as = "catppuccin" }
    use "rebelot/kanagawa.nvim"

    -- block comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- surround
    use('tpope/vim-surround')

    -- repeat
    use('tpope/vim-repeat')

    -- git integration
    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')

    -- undo tree
    use('mbbill/undotree')

    -- telescope
    -- use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.vim'}}}
    use('nvim-telescope/telescope.nvim')

    -- auto pairs
    use('windwp/nvim-autopairs')

    -- plenary (used for telescope)
    use("nvim-lua/plenary.nvim")

    -- telescope-fzf-native
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- harpoon bc the Primeagen is awesome
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- all things Go
    use('fatih/vim-go')

    -- zoxide
    use('jvgrootveld/telescope-zoxide')

    -- limlight for demos
    use('junegunn/limelight.vim')

    -- highlight function kwargs
    use('m-demare/hlargs.nvim')

    -- pretty devicons
    use('nvim-tree/nvim-web-devicons')

    -- git signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- treesitter for better syntax highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    })

    -- lualine for a nice status bar
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- set up LSP
    use({
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })

    -- nvim motions with leap
    use('ggandor/leap.nvim')

    -- treejs
    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter' },
        config = function()
            require('treesj').setup()
        end,
    })

    use({ 'voldikss/vim-floaterm' })

    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }

    use { 'FooSoft/vim-argwrap' }


    use {
        'folke/todo-comments.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        opts = {
        }
    }

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })

    use({ "backdround/improved-ft.nvim" })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use({ 'ThePrimeagen/git-worktree.nvim' })

    use({ 'backdround/global-note.nvim' })

    use({
        "epwalsh/obsidian.nvim",
        tag = "*", -- recommended, use latest release instead of latest commit
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "DemandForecasting",
                        path = "~/Documents/Notes/DemandForecasting/",
                    },
                },
            })
        end,
    })

    use({
        'rasulomaroff/telepath.nvim',
        requires = 'ggandor/leap.nvim',
        config = function()
            require('telepath').use_default_mappings()
        end
    })

    use({
        "NeogitOrg/neogit",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "sindrets/diffview.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
    })


    use { "shortcuts/no-neck-pain.nvim", tag = "*" }
end)
