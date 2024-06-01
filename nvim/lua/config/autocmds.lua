-- Auto format when saving
vim.api.nvim_create_augroup("autoformat", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = "autoformat",
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
})
