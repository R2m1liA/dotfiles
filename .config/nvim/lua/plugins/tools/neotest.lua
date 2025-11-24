return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
      }
    })
  end,
  keys = {
    { "<leader>ts", function() require('neotest').summary.toggle() end,              desc = "Toggle test summary" },
    { "<leader>tr", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Run all tests in current file" },
    { "<leader>tn", function() require("neotest").run.run() end,                     desc = "Run nearest test" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
    { "<leader>tc", function() require("neotest").run.stop() end,                    desc = "Stop test run" },
  }
}
