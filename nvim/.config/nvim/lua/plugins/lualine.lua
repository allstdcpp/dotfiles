local M = {}
M.plugin = {
	"nvim-lualine/lualine.nvim",
	config = function()
		local ll = require("lualine")
		ll.setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight",
                disabled_filetypes = {"NvimTree" }
			},
		})
	end,
}
return M
