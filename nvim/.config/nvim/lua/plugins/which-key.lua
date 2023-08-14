local M = {}

M.plugin = {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")
		wk.setup({

			wk.register({
				f = {
					name = "Files",
					f = { "<cmd>Telescope find_files<cr>", "Telescope Find File" },
                    r = { "<cmd>Telescope buffers<cr>", "Telescope Find Buffers"},
                    g = { "<cmd>Telescope live_grep<cr>", "Telescope Live Grep"},
                    h = { "<cmd>Telescope help_tags<cr>", "Telescope Tags"},
				},
                l = {
					name = "Language Server Protocol",
					D = { ":lua vim.lsp.buf.definition()<cr>", "Vi Goto Declaration" },
					d = { ":lua vim.lsp.buf.definition()<cr>", "Vi Goto Definition" },
                }
			}, { prefix = "<leader>" }),
		})
	end,
}

return M
