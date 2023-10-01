local telescope = require("telescope.builtin")

-- Setting keymaps.
vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
vim.keymap.set("n", "<C-p>", telescope.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
  telescope.live_grep()
end)

-- Search through help tags.
vim.keymap.set("n", "<leader>vh", telescope.help_tags, {})

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
