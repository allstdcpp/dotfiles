local M = {}

M.plugin = {
	"akinsho/toggleterm.nvim",
	config = function()
		local term = require("toggleterm")
		term.setup({
			open_mapping = [[<C-t>]],
			hide_numbers = true,
			autochdir = false,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			autoscroll = true,
			shade_terminals = true,
            start_in_insert = true,

		})

	end,
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

return M
