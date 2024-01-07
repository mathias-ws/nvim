return {
  {
    "mfussenegger/nvim-dap-python",

    ft = "python",

    event = {
      "BufReadPre",
      "BufNewFile",
    },

    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
  },
  {},
}
