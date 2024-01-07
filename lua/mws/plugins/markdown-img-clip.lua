local nvim_env = os.getenv("NVIM_ENV")

if nvim_env == "work" then
  return {}
else
  return {
    "HakonHarnes/img-clip.nvim",

    ft = "markdown",

    opts = {
      default = {
        dir_path = "assets",
        use_absolute_path = false,
        relative_to_current_file = true,
        prompt_for_file_name = false,
        insert_mode_after_paste = false,
      },
    },

    keys = {
      { "<leader>mi", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
    },
  }
end
