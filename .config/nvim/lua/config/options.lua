local opt = vim.opt

opt.clipboard = 'unnamedplus' -- use system clipboard
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.mouse = 'a'               -- allow mouse to be used in nvim

-- Tab
opt.tabstop = 2      -- number of visual spaces per TAB
opt.softtabstop = 2  -- number of spaces in tab when editing
opt.shiftwidth = 2   -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly because of Python

-- UI config
opt.number = true         -- show line numbers
opt.relativenumber = true -- use relative numbers
opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true     -- open new vertical split bottom
opt.splitright = true     -- open new horizontal split right
opt.termguicolors = true  -- enable 24-bit RGB color in the TUI

-- Searching
opt.incsearch = true  -- search as characters are entered
opt.hlsearch = false  -- do not hightlight matches
opt.ignorecase = true -- ignore case in search by default
opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
