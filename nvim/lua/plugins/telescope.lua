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
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {},
            { desc = "Show all project files in telescope" })

        vim.keymap.set('n', '<C-p>', builtin.git_files, {},
            { desc = "Show all git files in telescope" })

        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {},
            { desc = "Search project for string with telescope" })

        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {},
            { desc = "Show all help tags in telescope" })

        vim.keymap.set('n', '<leader>vk', builtin.keymaps, {},
            { desc = "Show all keymaps in telescope" })

        vim.keymap.set('n', '<leader>b', builtin.buffers, {},
            { desc = "Show all open buffers in telescope" })
    end,
}
