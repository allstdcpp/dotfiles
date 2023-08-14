local M = {}
M.plugin = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local t = require("telescope")
        local actions = require("telescope.actions")
        local zeal = require("nvim-telescope-zeal")

        t.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "cmake_build*", "cmake-build*", "*.git", "*.idea" },
            },
            prompt_prefix = " ",
            selection_caret = " ",
        })

        local ts = require("telescope.builtin")

        zeal.setup({
            lynx_dump = true,
            documentation_sets = {
                cpp = { title = "C++ Reference" },
            }
        });

        vim.keymap.set("n", "<leader>ff", function()
            ts.find_files({})
        end)
        vim.keymap.set("n", "<leader>fb", function()
            ts.buffers()
        end)
        vim.keymap.set("n", "<leader>fg", function()
            ts.live_grep()
        end)
        vim.keymap.set("n", "<leader>fh", function()
            ts.help_tags()
        end)
        vim.keymap.set("n", "<leader>fc", function()
            ts.commands()
        end)
        vim.keymap.set("n", "<leader>fk", function()
            ts.keymaps()
        end)
        vim.keymap.set("n", "<leader>fm", function()
            ts.marks()
        end)
        vim.keymap.set("n", "<leader>fr", function()
            zeal.show("cpp")
        end)

    end,
}

return M
