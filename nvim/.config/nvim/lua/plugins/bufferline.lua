local M = {}
M.plugin = {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                theme = true,
                diagnostics = "nvim_lsp",
                seperator_style = "slant",
                mode = "buffers",
                offsets = {
                    { filetype = "NvimTree" },
                },
            },
        })
    end,
}

return M
