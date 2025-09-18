return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "comment" },
    },
    enable_bracket_in_quote = false,
  },
  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local ts_utils = require("nvim-treesitter.ts_utils")

    -- setup nvim-autopairs
    npairs.setup(opts)

    npairs.add_rules({
      Rule("=", "\"\"", { "html", "vue", "javascriptreact", "typescriptreact" })
          :with_pair(function()
            -- 获取前一个字符的node类型
            local function get_node_type_before_cursor()
              local bufnr = vim.api.nvim_get_current_buf()
              local win = vim.api.nvim_get_current_win()
              local cursor = vim.api.nvim_win_get_cursor(win)
              local row = cursor[1] - 1 -- 0-based行
              local col = cursor[2]     -- Vim 的col是0-based或1-based取决，api 给的通常0-based？

              if col == 0 then
                return nil -- 行首没前一个字符
              end

              local pos = { row, col - 1 } -- 前一个字符位置，0-based
              -- 使用 treesitter API
              local node = vim.treesitter.get_node({ buf = bufnr, pos = pos, ignore_injections = true })
              if not node then
                return nil
              end

              return node:type()
            end

            local node = get_node_type_before_cursor()
            if not node then return false end
            if (node == "attribute_name") then
              return true
            else
              return false
            end
          end)
          :set_end_pair_length(1)
    })
  end
}
