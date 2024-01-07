-- Set leader to space
vim.g.mapleader = " "

-- Open terminal in H split
vim.api.nvim_set_keymap("n", "<leader>t", ":belowright split | terminal<CR>", { noremap = true, silent = true })

-- pv for explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Exit terminal mode with esc
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Add comments on selected lines in visual mode
vim.cmd([[
  autocmd FileType python,yaml vnoremap <buffer><leader>c :s/^/# /<CR>
]])

-- Add comments on the current line in normal mode
vim.cmd([[
  autocmd FileType python,yaml nnoremap <buffer><leader>c :s/^/# /<CR>
]])

-- Add comments to all lines of a file
vim.cmd([[
  autocmd FileType python,yaml nnoremap <buffer><leader>C :%s/^/# /<CR>
]])

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps the cursor in the middle of the screen when scrolling half-pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centers the screen when going through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard
local os_name = vim.loop.os_uname().sysname

if os_name == "Darwin" then
  -- macOS specific keybindings
  vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
  vim.keymap.set("n", "<leader>Y", [["*Y]])
else
  -- Linux specific keybindings
  vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
  vim.keymap.set("n", "<leader>Y", [["+Y]])
end

-- Using tab for indentation
vim.api.nvim_set_keymap("n", "<Tab>", ">>_", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<_", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
