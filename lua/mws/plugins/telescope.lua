return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
  },

  version = "*",

  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "venv", "virt_env", "env", ".idea", ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    local telescope = require("telescope.builtin")

    vim.keymap.set("n", "<leader>vh", telescope.help_tags, {})
    vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
    vim.keymap.set("n", "<C-p>", telescope.git_files, {})
    vim.keymap.set("n", "<leader>ps", function()
      telescope.live_grep()
    end)
  end,
}
