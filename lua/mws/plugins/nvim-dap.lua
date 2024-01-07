return {
  {
    "mfussenegger/nvim-dap-python",

    ft = "python",

    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },

    config = function()
      local python = require("dap-python")

      python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
      python.test_runner = "unittest"

      -- Function to set key mappings for Python files
      local function python_key_mappings()
        vim.api.nvim_buf_set_keymap(
          0,
          "n",
          "<leader>dn",
          "<cmd>lua require('dap-python').test_method()<CR>",
          { noremap = true, silent = true }
        )
        vim.api.nvim_buf_set_keymap(
          0,
          "n",
          "<leader>df",
          "<cmd>lua require('dap-python').test_class()<CR>",
          { noremap = true, silent = true }
        )
        vim.api.nvim_buf_set_keymap(
          0,
          "v",
          "<leader>ds",
          "<cmd>lua require('dap-python').debug_selection()<CR>",
          { noremap = true, silent = true }
        )

        -- Map key for setting breakpoint
        vim.api.nvim_set_keymap(
          "n",
          "<leader>b",
          [[<cmd>lua require('dap').toggle_breakpoint()<CR>]],
          { noremap = true, silent = true }
        )
      end

      -- Autocmd to apply the key mappings for Python files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = python_key_mappings,
      })

      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",

    ft = "go",

    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },

    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
          build_flags = "",
        },
      })

      local function go_key_mappings()
        vim.api.nvim_buf_set_keymap(
          0,
          "n",
          "<leader>dn",
          "<cmd>lua require('dap-go').debug_test()<CR>",
          { noremap = true, silent = true }
        )
      end

      -- Autocmd to apply the key mappings for Go files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = go_key_mappings,
      })

      -- Map key for setting breakpoint
      vim.api.nvim_set_keymap(
        "n",
        "<leader>b",
        [[<cmd>lua require('dap').toggle_breakpoint()<CR>]],
        { noremap = true, silent = true }
      )

      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
