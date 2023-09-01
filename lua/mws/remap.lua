-- Set leader to space
vim.g.mapleader = " "

-- Open terminal in H split
vim.api.nvim_set_keymap('n', '<leader>t', ':belowright split | terminal<CR>', { noremap = true, silent = true })

-- pv for explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Exit terminal mode with esc
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

