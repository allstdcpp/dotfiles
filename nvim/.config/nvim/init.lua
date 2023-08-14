vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function config(ctx)
    local opts = require("config/options")

    for k, v in pairs(opts.config) do
        ctx.opt[k] = v
    end
end

config(vim)

require("config/keymaps")

local lazy = require("config/lazy")

lazy.setup({
    { "nvim-lua/plenary.nvim" },
    require("plugins/fennel").plugin,
    require("plugins/aniseed").plugin,
    require("plugins/conjure").plugin,
    require("plugins/tokyo-night").plugin,
    require("plugins/bufferline").plugin,
    require("plugins/surround").plugin,
    require("plugins/cmake").plugin,
    require("plugins/lualine").plugin,
    require("plugins/terminal").plugin,
    require("plugins/treesitter").plugin,
    require("plugins/telescope").plugin,
    require("plugins/outline").plugin,
    require("plugins/lsp").plugin,
    require("plugins/nvim-cmp").plugin,
    require("plugins/indent").plugin,
    require("plugins/dap/init").plugin,
    require("plugins/trouble").plugin,
})

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
