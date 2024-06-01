return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return name == ".."
            end,
        },
        git = {
            -- Return true to automatically git add/mv/rm files
            add = function(path)
                return true
            end,
            mv = function(src_path, dest_path)
                return true
            end,
            -- This gives errors when removing files
            --rm = function(path)
            --    return true
            --end,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
