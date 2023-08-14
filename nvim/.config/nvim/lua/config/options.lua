local M = {}

local cinoptions = "N+s"
cinoptions = cinoptions .. ",g0,h4"

M.config = {
    showmatch = true,
    ignorecase = true,
    mouse = "a",
    hlsearch = false,
    incsearch = true,
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    cursorline = true,
    ttyfast = true,
    updatetime = 300,
    encoding = "utf-8",
    backup = false,
    writebackup = false,
    signcolumn = "yes",
    cindent = true,
    cinoptions = cinoptions
}

return M
