return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_c = { "filename", "os.date('%H:%M')" },
				lualine_x = { "encoding", "lsp_status" },
				lualine_y = { "location", "progress" },
				lualine_z = { "filetype" },
			},
			inactive_sections = {},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		submodules = false,
		main = "rainbow-delimiters.setup",

		opts = {},
	},
}
