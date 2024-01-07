-- Map key for setting breakpoint
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  [[<cmd>lua require('dap').toggle_breakpoint()<CR>]],
  { noremap = true, silent = true }
)

--Python setup
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
end

-- Autocmd to apply the key mappings for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = python_key_mappings,
})

local go = require("dap-go")

go.setup({
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
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
