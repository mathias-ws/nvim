local nvim_env = os.getenv("NVIM_ENV")

if nvim_env == "work" then
  return {}
else
  return {
    "epwalsh/obsidian.nvim",

    version = "*",

    ft = "markdown",

    event = {
      "BufReadPre /Users/mathias/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
      "BufNewFile /Users/mathias/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  }
end
