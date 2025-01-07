return{
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
                    "ansiblels"

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
                capabilities = capabilities
            })
    end
    },
}
