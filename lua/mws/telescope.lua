local builtin = require('telescope.builtin')

-- Setting keymaps.
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "venv", "virt_env", "env" }
    }
})


