local M = {}

M.plugin = {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python",
    },
    config = function()

        local dap = require("dap")
        local cmake = require("cmake-tools")

        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "/home/bdavidson/tools/cpptools/extension/debugAdapters/bin/OpenDebugAD7", -- adjust as needed, must be absolute path
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "cppdbg",
                request = "launch",
                program = function()

                    if cmake.is_cmake_project() then
                        if (cmake.get_build_type() == nil) or (cmake.get_build_target() == nil) then
                            vim.cmd.CMakeBuild()
                            return
                        end
                        return vim.fn.input("CMake Build Target Executable: ",
                            vim.fn.getcwd() ..
                            "/cmake_build_" .. cmake.get_build_type() .. "/" .. cmake.get_build_target(), "file")
                    else
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd(), "file")
                    end
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        local dappython = require("dap-python")
        dappython.setup('~/tools/virtualenvs/debugpy/bin/python')

        dap.adapters.debugpy = {
            id = "debugpy",
            type = "executable",
            command = '/home/bdavidson/tools/virtualenvs/debugpy/bin/python',
            args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
            {
                type = 'debugpy',
                name = 'Launch file - auto-detect python',
                request = 'launch',
                program = "${file}",
                pythonPath = function()
                    local py_bin = vim.b.python

                    if not py_bin then
                        local py_home = os.getenv('PYENV_VIRTUAL_ENV') or os.getenv('VIRTUAL_ENV')

                        if py_home then
                            py_bin = require('local.os').joinpath2(py_home, 'bin/python')
                        else
                            py_bin = vim.fn.exepath('python3')
                        end
                    end

                    print('Using Python: ' .. py_bin)
                    return py_bin
                end
            },


        }

        local dapui = require("dapui")
        dapui.setup({
            controls = {
                element = "repl",
                enabled = true
            },
        })
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)
        vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>du", function()
            dapui.toggle()
        end)
    end,
}

return M
