return {
  "mfussenegger/nvim-lint",

  opts = {
    linters_by_ft = {
      go = { "golangcilint" },
    },
  },

  config = function(_, opts)
    local lint = require("lint")

    lint.linters_by_ft = opts.linters_by_ft

    -- 保存时触发lint
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
