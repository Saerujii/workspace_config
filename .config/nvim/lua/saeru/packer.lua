-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "rose-pine/neovim", as = "rose-pine" }
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use { "nvim-treesitter/nvim-treesitter-context" }
    use('nvim-treesitter/playground')
    use({ 'ThePrimeagen/harpoon', branch = "harpoon2" })
    use('tpope/vim-fugitive')

    use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })

    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    use({ "ThePrimeagen/vim-be-good" })

    use "fladson/vim-kitty"

    use "lukas-reineke/indent-blankline.nvim"

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use "EmranMR/tree-sitter-blade"

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use "phpactor/phpactor"

    use 'averms/black-nvim'

    use {
        "ray-x/lsp_signature.nvim"
    }

    use { "mbbill/undotree" }

    use { 'uga-rosa/ccc.nvim' }

    use {
        "ThePrimeagen/refactoring.nvim",
    }
end)
