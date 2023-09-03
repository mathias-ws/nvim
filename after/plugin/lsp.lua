local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.omnifunc.setup({
  tabcomplete = true,
  use_fallback = true,
  update_on_delete = true,
})

lsp.setup_servers({'tsserver', 'eslint'})

lsp.ensure_installed({
    "pyright",
    "ruff_lsp",
    "ansiblels",
    "lua_ls"
})

require("lspconfig").pyright.setup({
    filetypes = {"python"},
    settings = {
        python = {
            analysis = {
                venvPath = "./venv"
            }
        }
    }
})

require("lspconfig").ruff_lsp.setup({
    on_attatch = function (client, bufnr)
        client.server_capabilities.hoverProvider = false
    end,
    init_options = {
    settings = {
      args = {},
    }
  }
})

require("lspconfig").ansiblels.setup({
    filetypes = {
       "yaml.ansible",
  },
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
        useFullyQualifiedCollectionNames = true
      },
      ansibleLint = {
        enabled = true,
        path = "ansible-lint"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python3"
      },
      completion = {
          provideRedirectModules = true,
          provideModuleOptionAliases = true
      }
    },
  },
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Key bindings
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()

-- Configuring cmp
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
    }
})



