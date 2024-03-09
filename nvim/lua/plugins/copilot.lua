return {
    -- Copilot itself
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        config = function()
            require('copilot').setup {
                panel = {
                    enabled = false,
                },
                suggestion = {
                    enabled = false,
                },
                filetypes = {
                    markdown = true,
                },
            }
        end,
    },

    -- Copilot cmp integration
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },

    -- Copilot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            local chat = require("CopilotChat")
            chat.setup {
                context = 'buffers',
                debug = false, -- Enable debugging
                window = {
                    show_user_selection = false,
                    auto_follow_cursor = true,
                    layout = 'float',
                    border = 'rounded',
                    title = 'Copilot Chat',
                }
            }
            vim.keymap.set('n', '<leader>co', chat.open, {})
        end,
    },
}
