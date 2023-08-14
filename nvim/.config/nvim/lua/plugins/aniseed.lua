local M = {}

M.plugin = {
    "Olical/aniseed",
    config = function()
        require("aniseed.env").init()

    end
}

return M
