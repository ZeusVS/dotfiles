return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set('n', '<leader>ud', vim.cmd.UndotreeToggle)
    end
}