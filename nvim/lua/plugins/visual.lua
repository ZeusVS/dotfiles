return {
    -- Colorscheme
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Disable all italics because they alwas get clipped
            require('kanagawa').setup({
                transparent = true,
            })
            vim.cmd("colorscheme kanagawa-dragon")
        end
    },

    -- Icons
    {
        'nvim-tree/nvim-web-devicons'
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                globalstatus = false,
                theme = "auto",
                section_separators = '',
                component_separators = '',
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        newfile_status = true,
                        path = 3,
                    },
                },
            },
        },
    },

    -- Indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
    },
}

