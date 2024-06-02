return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')

        -- REQUIRED
        harpoon:setup {}
        -- REQUIRED

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            { desc = "Add current buffer to the harpoon list" })
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window in telescope" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end,
            { desc = "Go to harpoon list item 1" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end,
            { desc = "Go to harpoon list item 2" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end,
            { desc = "Go to harpoon list item 3" })
        vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end,
            { desc = "Go to harpoon list item 4" })
    end,
}
