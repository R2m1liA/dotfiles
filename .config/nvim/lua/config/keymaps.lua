vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------
-- Normal mode --
-----------------

map("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
