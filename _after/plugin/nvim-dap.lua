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

-- Mapping for testing method with dap-python
vim.api.nvim_set_keymap(
  "n",
  "<leader>dn",
  [[<cmd>lua require('dap-python').test_method()<CR>]],
  { noremap = true, silent = true }
)

-- Mapping for testing class with dap-python
vim.api.nvim_set_keymap(
  "n",
  "<leader>df",
  [[<cmd>lua require('dap-python').test_class()<CR>]],
  { noremap = true, silent = true }
)

-- Mapping for debugging selection with dap-python
vim.api.nvim_set_keymap(
  "v",
  "<leader>ds",
  [[<cmd>lua require('dap-python').debug_selection()<CR>]],
  { noremap = true, silent = true }
)
