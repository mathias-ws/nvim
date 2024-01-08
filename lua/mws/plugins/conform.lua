local nvim_env = os.getenv("NVIM_ENV")

if nvim_env == "work" then
  return {
    "stevearc/conform.nvim",

    event = {
      "BufReadPre",
      "BufNewFile",
    },

    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          html = { "prettier" },
          json = { "jq" },
          yaml = { "prettier" },
          xml = { "prettier" },
          markdown = { "prettier" },
          python = { "isort", "black" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>ff", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  }
else
  return {
    "stevearc/conform.nvim",

    event = {
      "BufReadPre",
      "BufNewFile",
    },

    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          html = { "prettier" },
          json = { "jq" },
          yaml = { "prettier" },
          xml = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>ff", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  }
end
