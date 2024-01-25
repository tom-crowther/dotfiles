return {
	{"nvim-telescope/telescope.nvim", tag = '0.1.2'},

	"nvim-treesitter/playground",
	"nvim-lua/plenary.nvim",
	"mbbill/undotree",
	"tpope/vim-fugitive",


    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim', config = true},
            {'williamboman/mason-lspconfig.nvim'},
            {'j-hui/fidget.nvim', opts = {} },
            'folke/neodev.nvim'
        },

    },

	{
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            'hrsh7th/cmp-path',
            'rafamadriz/friendly-snippets',
        }
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },

    { 'numToStr/Comment.nvim', opts = {} },
}


