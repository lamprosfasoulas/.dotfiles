return {
    {
    "williamboman/mason.nvim",
        dependencies ={
            "williamboman/mason-lspconfig.nvim",
        },
    config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
        mason.setup()
        mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "ast_grep",
                    "gopls",
                    "rust_analyzer",
                    "ansiblels",

                },
                automatic_installation = true,
            })
    end
    },
    {
    "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
    config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.bashls.setup({
                capabilities = capabilities
            })
            lspconfig.ast_grep.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.ansiblels.setup({
                cmd = { "ansible-language-server", "--stdio" },
                filetypes = { "yaml" },
                root_dir = require('lspconfig').util.find_git_ancestor,
                settings = {
                    ansible = {
                        ansible = {
                            path = "ansible", -- Optional, specify custom ansible binary if needed
                        },
                        executionEnvironment = {
                            enabled = false, -- Set to true if using an execution environment
                        },
                        python = {
                            interpreterPath = "python3", -- Use the correct Python interpreter
                        },
                    },
                },
            })
    end
    },
    -- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

    --[[{
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {},
                gopls = {}
            }
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            lspconfig['lua_ls'].setup({ capabilities = capabilities })
            lspconfig['gopls'].setup({ capabilities = capabilities })
        end
    },
    --]]
}
