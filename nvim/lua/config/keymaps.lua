-- set space to leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Set 'gd' to '<c-]>' which is project-wide goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set(
	"n",
	"<leader>ca",
	vim.lsp.buf.code_action,
	{ desc = "Show code actions" }
)

-- in visual mode, make J and K move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- make cursor stay centered when using C-d and C-u
vim.keymap.set(
	"n",
	"<C-d>",
	"<C-d>zz",
	{ desc = "Default <C-d> motion, but keep cursor centered" }
)
vim.keymap.set(
	"n",
	"<C-u>",
	"<C-u>zz",
	{ desc = "Default <C-u> motion, but keep cursor centered" }
)

-- keep cursor in the middle when searching
vim.keymap.set(
	"n",
	"n",
	"nzzzv",
	{ desc = "Default n motion, but keep cursor centered" }
)
vim.keymap.set(
	"n",
	"N",
	"Nzzzv",
	{ desc = "Default N motion, but keep cursor centered" }
)

-- paste without overwriting the current paste buffer
vim.keymap.set(
	"x",
	"<leader>p",
	'"_dP',
	{ desc = "Paste without overwriting the current paste buffer" }
)

-- yank to system clickboard with <leader>y/Y
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank to system clipboard" })

-- delete without overwriting current paste buffer
vim.keymap.set(
	"n",
	"<leader>d",
	'"_d',
	{ desc = "Delete without overwriting the current paste buffer" }
)
vim.keymap.set(
	"v",
	"<leader>d",
	'"_d',
	{ desc = "Delete without overwriting the current paste buffer" }
)

-- set capital Q to do nothing
vim.keymap.set("n", "Q", "<nop>")
