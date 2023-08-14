local M = {}
M.plugin = {
	"folke/tokyonight.nvim",
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("tokyonight")
	end,
}

return M
