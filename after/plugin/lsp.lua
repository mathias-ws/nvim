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
                interpreterPath = "python"
            },
            completion = {
                provideRedirectModules = true,
                provideModuleOptionAliases = true
            }
        },
    },
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- Configuring cmp
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
    }
})



