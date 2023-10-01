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
            {
                'williamboman/mason.nvim',
                opts = {
                    ensure_installed = {
                        "black",
                        "debugpy",
                    },
                }
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            {"WhoIsSethDaniel/mason-tool-installer.nvim"},
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
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function (_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpu/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
}
