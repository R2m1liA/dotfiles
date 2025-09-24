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

            local function in_list(value, list)
              for _, v in ipairs(list) do
                if v == value then
                  return true
                end
              end
              return false
            end

            local allowed_nodes = {
              "attribute_name",  -- 属性
              "directive_name",  -- 指令属性
              "directive_value", -- 指令属性
            }

            local node = get_node_type_before_cursor()
            if not node then return false end
            if in_list(node, allowed_nodes) then
              return true
            else
              return false
            end
          end)
          :set_end_pair_length(1)
    })
  end
}
