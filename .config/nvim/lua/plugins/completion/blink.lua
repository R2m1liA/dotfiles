-- helper: if cursor is in comment or string
local function in_string_or_comment()
	local ts = vim.treesitter
	if not ts then
		return false
	end

	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local bufnr = vim.api.nvim_get_current_buf()
	local ok, node = pcall(ts.get_node, { bufnr = bufnr, pos = { row - 1, col - 1 } })

	if not ok or not node then
		return false
	end

	while node do
		local t = node:type()
		if
			t == "comment"
			or t == "comment_content"
			or t == "line_comment"
			or t == "block_comment"
			or t == "string"
			or t == "string_fragment"
			or t == "string_content"
			or t == "string_start"
			or t == "string_end"
		then
			return true
		end
		node = node:parent()
	end
	return false
end

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",
			["<A-j>"] = {
				function(cmp)
					return cmp.select_next({ auto_insert = false })
				end,
				"fallback",
			},
			["<A-k>"] = {
				function(cmp)
					return cmp.select_prev({ auto_insert = false })
				end,
				"fallback",
			},
			["<CR>"] = {
				function(cmp)
					return cmp.accept()
				end,
				"fallback",
			},
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			auto_show = function()
				if in_string_or_comment() then
					return false
				else
					return true
				end
			end,
			accept = { auto_brackets = { enabled = true } },
			list = { selection = { preselect = true, auto_insert = false } },
			menu = {
				border = "rounded",
				max_height = 20,
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
				-- Delay before showing the documentation window
				auto_show_delay_ms = 200,
				window = {
					min_width = 10,
					max_width = 120,
					max_height = 20,
					border = "rounded",
					scrollbar = true,
					direction_priority = {
						menu_north = { "e", "w", "n", "s" },
						menu_south = { "e", "w", "s", "n" },
					},
				},
			},
			ghost_text = {
				enabled = true,
				-- Show the ghost text when an item has been selected
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev compeletions top priority
					score_offset = 100,
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
