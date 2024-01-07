local nvim_env = os.getenv("NVIM_ENV")

if nvim_env == "work" then
  return {}
else
  return {
    "iamcco/markdown-preview.nvim",

    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

    ft = { "markdown" },

    build = function()
      vim.fn["mkdp#util#install"]()
    end,

    config = function()
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>")
    end,
  }
end
