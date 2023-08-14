local M = {}
M.plugin = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "lukas-reineke/lsp-format.nvim",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local ts = require("telescope.builtin")
        local format = require("lsp-format")

        format.setup({})

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
        vim.keymap.set("n", "<leader>rf", "<cmd>:Format<cr>");

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.lua_ls.setup({
            on_attach = format.on_attach,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        lspconfig.marksman.setup({
            cmd = { "/home/bdavidson/tools/dotnet/marksman", "server" },
        });

        lspconfig.cmake.setup({})
        lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = format.on_attach
        })
        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = format.on_attach
        })

        vim.keymap.set("n", "<leader>lr", function()
            ts.lsp_references()
        end)

        vim.keymap.set("n", "<leader>ld", function()
            ts.lsp_definitions()
        end)

        vim.keymap.set("n", "<leader>lt", function()
            ts.lsp_type_definitions()
        end)

        vim.keymap.set("n", "<leader>li", function()
            ts.lsp_implementations()
        end)

        vim.keymap.set("n", "<leader>ls", function()
            ts.lsp_document_symbols()
        end)

        vim.keymap.set("n", "<leader>rr", function()
            vim.lsp.buf.rename()
        end)

        local signs = {
            Warning = " ",
            Error = " ",
            Hint = " ",
            Information = " "
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end,
}
return M
