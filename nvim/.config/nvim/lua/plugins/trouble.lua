local M = {}
M.plugin = {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local t = require("trouble")
        t.setup({
            icons = true
        })

        vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>");
    end
}

return M
