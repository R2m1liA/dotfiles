return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
  settings = {
    Lua = {
      disgnostic = {
        globals = { "vim" } -- make lua language server recognize global vim config
      },
      workspace = {
        library = {
          vim.fn.stdpath("config"), -- load config folder
          vim.env.VIMRUNTIME, -- load neivim runtime
        },
        checkThirdParty = false, -- disable third party check
      },
    }
  },
}
