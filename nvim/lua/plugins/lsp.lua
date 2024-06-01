return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Set up mason
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Set up cmp for autocompletion
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        -- Set up snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },

    config = function()
        -- Configure mason and mason_lsp to automatically set up lspconfig
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "sqlls",
                "gopls",
            },

            handlers = {
                -- Set up automatic installation of all installed LSP's
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                -- Add vim as a global for .lua files
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    })
                end,

                -- Remove annoying tsserver remark 'File is a CommonJS module'
                ["tsserver"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.tsserver.setup({
                        init_options = {
                            preferences = {
                                disableSuggestions = true,
                            },
                        },
                    })
                end,

                -- To use sqlls create a ~/.config/sql-language-server/.sqllsrc.json file
                ["sqlls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.sqlls.setup({
                        root_dir = function() return vim.loop.cwd() end
                    })
                end,


                -- Setup gofumpt formatting within gopls
                ["gopls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.gopls.setup({
                        settings = {
                            gopls = {
                                gofumpt = true,
                                staticcheck = true,
                            }
                        }
                    })
                end,

            },
        })

        -- Configure cmp
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                completion = { -- rounded border; thin-style scrollbar
                    border = nil,
                    scrollbar = '',
                },
                -- documentation = cmp.config.window.bordered(),
                documentation = { -- no border; native-style scrollbar
                    border = nil,
                    scrollbar = '',
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' },
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'buffer' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end,
}
