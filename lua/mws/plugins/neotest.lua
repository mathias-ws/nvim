return {
  "nvim-neotest/neotest",

  ft = {
    "python",
    "go",
  },

  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
  },

  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = {
            justMyCode = false,
            console = "integratedTerminal",
          },
          runner = "unittest",
          pythonPath = function()
            return os.getenv("VIRTUAL_ENV") .. "/bin/python"
          end,
        }),
        require("neotest-go"),
      },
    })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>dm",
      [[<cmd>lua require('neotest').run.run()<cr>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>dM",
      [[<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>df",
      [[<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>dF",
      [[<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>dS",
      [[<cmd>lua require('neotest').summary.toggle()<cr>]],
      { noremap = true, silent = true }
    )
  end,
}
