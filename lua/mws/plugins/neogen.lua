return {
  "danymat/neogen",

  dependencies = "nvim-treesitter/nvim-treesitter",

  ft = "python",

  config = function()
    require("neogen").setup({
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "reST",
          },
        },
      },
    })

    -- Sets keymap for formatting generating documentation.
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>gc", ":lua require('neogen').generate()<CR>", opts)
  end,
}
