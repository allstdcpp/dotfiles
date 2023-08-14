local M = {}
M.plugin = {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local tree = require("nvim-tree")
		tree.setup({
			sort_by = "case-sensitive",
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
            diagnostics = {
                enable = true
            }
		})
		vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeToggle<cr>")
		vim.keymap.set("n", "<leader>tc", "<cmd>:NvimTreeClose<cr>")
		vim.keymap.set("n", "<leader>tf", "<cmd>:NvimTreeFocus<cr>")
		vim.keymap.set("n", "<leader>tr", "<cmd>:NvimTreeRefresh<cr>")
	end,
}

return M
