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
        vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>");
    end
}

return M
