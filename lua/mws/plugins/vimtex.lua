local nvim_env = os.getenv("NVIM_ENV")

if nvim_env == "work" then
  return {}
else
  return {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "skim"
    end,
  }
end
