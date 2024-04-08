local nvim_env = os.getenv("NVIM_ENV")

if nvim_env == "work" then
  return {}
else
  return {
    "github/copilot.vim",

    branch = "release",

    config = function()
      -- Use control + enter to accept copilot suggstions
      vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  }
end
