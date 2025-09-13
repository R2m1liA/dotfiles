return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  opts = {
    transparent_background = true,
    intergrations = {
    }
  },
  config = function()
    -- Load the colorscheme: catppuccin-frappe
    vim.cmd.colorscheme "catppuccin-frappe"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
