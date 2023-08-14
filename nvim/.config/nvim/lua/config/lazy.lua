
local M = {}

function M.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function M.setup(plugins)
	M.install(M.path)

	vim.opt.rtp:prepend(M.path)
	require("lazy").setup(plugins, M.opts)
end

M.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
M.opts = {}

return M
