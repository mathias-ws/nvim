return {
  "VonHeikemen/lsp-zero.nvim",

  dependencies = {
    { "neovim/nvim-lspconfig" }, -- Required
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "L3MON4D3/LuaSnip" }, -- Required
  },
}
