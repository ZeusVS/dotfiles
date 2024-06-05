return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")

		oil.setup({
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
		})

		vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open oil" })
	end,
}
