return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  opts = {
    transparent_background = true,
    auto_integrations = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- Load the colorscheme: catppuccin-frappe
    vim.cmd.colorscheme "catppuccin-frappe"
  end,
}
