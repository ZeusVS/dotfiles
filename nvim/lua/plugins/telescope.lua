return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            pickers = {
                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                },
            },
        }
        telescope.load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>vk', builtin.keymaps, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    end,
}
