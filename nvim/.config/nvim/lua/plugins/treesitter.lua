local M = {}

M.plugin = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local ts = require("nvim-treesitter.configs")

		ts.setup({
			ensure_installed = {
				"bash",
				"cmake",
				"c",
				"cpp",
				"lua",
				"luadoc",
				"vim",
				"query",
				"json",
				"ini",
				"python",
				"markdown",
				"clojure",
				"fennel",
			},
			sync_installed = false,
			auto_install = true,
			autopairs = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = true,
			},
			indent = { enable = true, disable = { "yaml", "cpp", "c" } },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil
            },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}

return M
