return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local todo = require('todo-comments')
        todo.setup {
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                },
            },
        }
        vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end,
            { desc = "Next todo comment" })

        vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end,
            { desc = "Previous todo comment" })

        vim.keymap.set("n", "<leader>t", "<CMD>TodoTelescope<CR>",
            { desc = "Search through all project todos with Telescope" })
    end
}
