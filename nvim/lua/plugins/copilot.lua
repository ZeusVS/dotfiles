return {
    -- Copilot itself
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "VeryLazy",
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
        event = "VeryLazy",
        config = function ()
            require("copilot_cmp").setup()
        end
    },

    -- Copilot chat
    -- This is the canary build because that's the only one available in lua
    -- Theres issues and it's basically unusable
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        event = "VeryLazy",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            local chat = require("CopilotChat")
            chat.setup {
                debug = false, -- Enable debugging
                context = 'buffers',
                selection = require("CopilotChat.select").buffer,
                window = {
                    layout = 'vertical',
                }
            }
            vim.keymap.set('n', "<leader>co", function()
                chat.open()
            end, {})
        end,
    },
}
