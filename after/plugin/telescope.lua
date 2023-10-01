local builtin = require("telescope.builtin")

-- Setting keymaps.
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
  require("telescope.builtin").live_grep()
end)

-- Search through help tags.
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "venv", "virt_env", "env", ".idea", ".git" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})
