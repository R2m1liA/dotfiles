require("config.options")
require("config.lsp")

require("config.lazy")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { { import = "plugins.core" },
      { import = "plugins.ui" },
      { import = "plugins.lsp" },
      { import = "plugins.completion" },
      { import = "plugins.tools" },
      { import = "plugins.ai" },
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
