return {
    "mhinz/vim-signify",
    "tpope/vim-fugitive",
    "pearofducks/ansible-vim",
    "navarasu/onedark.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mbbill/undotree",
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
    },
}
