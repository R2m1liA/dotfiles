local lsp = vim.lsp

-- Enable LSP
lsp.enable("lua_ls")
lsp.enable("clangd")
lsp.enable("vtsls")
lsp.enable("vue_ls")
lsp.enable("eslint")

-- Enable diagnostic
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "",
  },                        -- enable inline error/warning message
  signs = true,             -- enable signs in sign column
  underline = true,         -- underline error/warnging text
  update_in_insert = false, -- disable diagnostic update in insert mode
  severity_sort = true,     -- sort diagnostics by severity
  float = {
    border = "rounded",
  },
})
