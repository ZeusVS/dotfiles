-- Show messages on opening
vim.api.nvim_create_autocmd("VimEnter", {
	command = 'messages" ',
})

-- Auto format when saving
vim.api.nvim_create_augroup("autoformat", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = "autoformat",
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = "autoformat",
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
