-- set space to leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Set <leader>pv to 'project-view' (oil.nvim)
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

-- Set 'gd' to '<c-]>' which is project-wide goto definition
vim.keymap.set("n", "gd", "<c-]>")

-- in visual mode, make J and K move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- make cursor stay centered when using C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without overwriting the current paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clickboard with <leader>y/Y
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete without overwriting current paste buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- set capital Q to do nothing
vim.keymap.set("n", "Q", "<nop>")
