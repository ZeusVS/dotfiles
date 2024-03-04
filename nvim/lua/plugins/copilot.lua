return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
        local copilot = require('copilot')
        copilot.setup{
            'bottom', 0.4
        }
        local panel = require('copilot.panel')
        vim.keymap.set('n', '<leader>co', panel.open, {})
    end,
}
