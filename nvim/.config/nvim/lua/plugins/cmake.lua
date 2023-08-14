local M = {}

M.plugin = {
    "Civitasv/cmake-tools.nvim",
    commit = "c8e2fc4044536ec9b1da7a92800b4dcdb6454c4a",
    config = function()
        local cmake = require("cmake-tools")
        cmake.setup({
            cmake_command = "cmake",
            cmake_build_directory = "",
            cmake_build_directory_prefix = "cmake_build_",
            cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
            cmake_generate_on_save = false,
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_show_console = true,
            cmake_variants_message = {
                short = { show = true },
                long = { show = true, max_length = 40 },
            },
            cmake_quickfix_opts = {
                show = "always",
                position = "belowright",
                size = 10,
            },
        })

        vim.keymap.set("n", "<leader>cg", function()
            vim.cmd.CMakeOpen()
            vim.cmd.CMakeGenerate()
        end)
        vim.keymap.set("n", "<leader>cb", function()
            vim.cmd.CMakeOpen()
            vim.cmd.CMakeBuild()
        end)
        vim.keymap.set("n", "<leader>cr", function()
            vim.cmd.CMakeOpen()
            vim.cmd.CMakeRun()
        end)
        vim.keymap.set("n", "<leader>cc", function()
            vim.cmd.CMakeClose()
        end)
        vim.keymap.set("n", "<leader>cl", function()
            vim.cmd.CMakeOpen()
            vim.cmd.CMakeClean()
        end)
    end,
}
return M
