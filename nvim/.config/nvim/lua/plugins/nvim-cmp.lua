local M = {}
M.plugin = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "ray-x/lsp_signature.nvim",
        "L3MON4D3/LuaSnip",
        "PaterJason/cmp-conjure",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local signature_config = {
            log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
            debug = true,
            hint_enable = false,
            handler_opts = { border = "rounded" },
            max_width = 120,
            anchor = 'SW',
            relative = 'cursor',
            floating_window_off_x = 0,
            floating_window_off_y = 0
        }

        require("lsp_signature").setup(signature_config)

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.expandable() then
                        cmp.close()
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        cmp.close()
                        luasnip.expand_or_jump()
                    elseif cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
        })

        --require 'cmp'.setup {
        --    sources = {
        --        { name = 'conjure' },
        --    }
        --}
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            sources = {
                { name = "dap" },
            },
        })

        vim.keymap.set({ 'n' }, '<Leader><space>', function()
            vim.lsp.buf.signature_help()
        end)
    end,
}

return M
