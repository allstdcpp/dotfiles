local M = {}

M.plugin = {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python", "conjure" },
    config = function(_, opts)
        require("conjure.main").main()
        require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
        vim.g["conjure#debug"] = true
        vim.g["aniseed#env"] = true
    end,
}

return M
