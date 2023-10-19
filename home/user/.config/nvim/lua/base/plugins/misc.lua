return {
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'google/vim-searchindex',
    'rbgrouleff/bclose.vim',
    'chaoren/vim-wordmotion',
    {
        'windwp/nvim-autopairs',
        desc = "Auto pair brackets and tags",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        enabled = vim.fn.executable "git" == 1,
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
    {
        'preservim/tagbar',
        keys = {
            { '<Leader>t', '<cmd>TagbarToggle<CR>' }
        },
        enabled = vim.fn.executable "ctags" == 1
    },
    {
        'preservim/vimux',
        enabled = vim.fn.executable "tmux" == 1
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"python", "lua", "vim", "html", "rust", "markdown"},
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require("trouble").setup()
        end
    },
}
