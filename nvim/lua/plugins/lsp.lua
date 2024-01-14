return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Set up mason for some sweet automation
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
            },
        })

        -- Configure cmp
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })
    end,
}
