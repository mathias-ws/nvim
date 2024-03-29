local nvim_env = os.getenv("NVIM_ENV")

return {
  "VonHeikemen/lsp-zero.nvim",

  branch = "v3.x",

  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "neovim/nvim-lspconfig" }, -- Required
    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "L3MON4D3/LuaSnip" }, -- Required
  },

  config = function()
    local lsp = require("lsp-zero")
    local mason_tool_installer = require("mason-tool-installer")
    local mason_lspconfig = require("mason-lspconfig")

    require("mason").setup({})

    lsp.preset("recommended")

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, opts)
        vim.keymap.set("n", "<C-h>", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>vca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-k>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end,
    })

    lsp.omnifunc.setup({
      tabcomplete = true,
      use_fallback = true,
      update_on_delete = true,
    })

    -- Not installing all LSPs on work devices.
    if nvim_env == "work" then
      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",
          "ansiblels",
          "yamlls",
          "gopls",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "ruff",
          "black",
          "isort",
          "mypy",
          "ansible-lint",
          "jsonlint",
          "yamllint",
          "markdownlint",
          "jq",
          "debugpy",
          "delve",
        },
      })
    else
      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",
          "ansiblels",
          "lua_ls",
          "yamlls",
          "terraformls",
          "gopls",
          "bashls",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "ruff",
          "black",
          "isort",
          "mypy",
          "ansible-lint",
          "jsonlint",
          "yamllint",
          "markdownlint",
          "jq",
          "debugpy",
          "delve",
        },
      })
    end

    require("lspconfig").pyright.setup({
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            venvPath = "./venv",
          },
        },
      },
    })

    require("lspconfig").ansiblels.setup({
      filetypes = {
        "yaml.ansible",
      },
      settings = {
        ansible = {
          ansible = {
            path = "ansible",
            useFullyQualifiedCollectionNames = true,
          },
          ansibleLint = {
            enabled = true,
            path = "ansible-lint",
          },
          executionEnvironment = {
            enabled = false,
          },
          python = {
            interpreterPath = "python3",
          },
          completion = {
            provideRedirectModules = true,
            provideModuleOptionAliases = true,
          },
        },
      },
    })

    require("lspconfig").gopls.setup({})

    if nvim_env ~= "work" then
      require("lspconfig").terraformls.setup({
        filetypes = { "terraform", "tf" },
      })

      require("lspconfig").bashls.setup({})

      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      require("lspconfig").yamlls.setup({
        settings = {
          yaml = {
            schemas = {
              kubernetes = "*.yaml",
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
              ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
              ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
              ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
              ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
              ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
              ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
              ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
              ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
            },
            format = {
              enable = false,
            },
            validate = true,
            completion = true,
            hover = true,
          },
        },
      })
    else
      require("lspconfig").yamlls.setup({
        settings = {
          yaml = {
            format = {
              enable = false,
            },
            validate = true,
            completion = true,
            hover = true,
          },
        },
      })
    end

    -- Configuring cmp
    local cmp = require("cmp")

    cmp.setup({
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      },
    })
  end,
}
