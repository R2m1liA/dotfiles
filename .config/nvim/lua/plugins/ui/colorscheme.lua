return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  ---@type CatppuccinOptions
  opts = {
    flavour = "frappe",
    transparent_background = true,
    float = {
      transparent = true,
      solid = false,
    },
    auto_integrations = true,
    custom_highlights = function(colors)
    return {
        CursorLineNr = { fg = colors.rosewater },
        LineNr = { fg = colors.overlay0 }
    }
  end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- Load the colorscheme: catppuccin-frappe
    vim.cmd.colorscheme "catppuccin"
  end,
}
