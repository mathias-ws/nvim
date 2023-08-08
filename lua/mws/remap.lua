vim.g.mapleader = " "
vim.opt.relativenumber = true

-- Open terminal in H split
vim.api.nvim_set_keymap('n', '<leader>t', ':belowright split | terminal<CR>', { noremap = true, silent = true })

-- pv for explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

