return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",

	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup({})
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add current buffer to the harpoon list" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end, { desc = "Go to harpoon list item 1" })

		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end, { desc = "Go to harpoon list item 2" })

		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(3)
		end, { desc = "Go to harpoon list item 3" })

		vim.keymap.set("n", "<C-;>", function()
			harpoon:list():select(4)
		end, { desc = "Go to harpoon list item 4" })

		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Go to previous harpoon list item" })

		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Go to next harpoon list item" })
	end,
}
