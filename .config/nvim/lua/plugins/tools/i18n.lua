return {
	"yelog/i18n.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		locales = { "en", "zh" },
		sources = {
			"src/locales/{locales}.json",
			"i18n/locales/{locales}.json",
		},
	},
}
