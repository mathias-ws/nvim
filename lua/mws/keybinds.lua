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
