return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "ast_grep",
                    "gopls",
                    "rust_analyzer",
                    "yamlls",
                    "docker_compose_language_service",
                    "dockerls",
                    "ts_ls",
                    "html",
                    "tailwindcss",
                    "terraformls",

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
            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'L', vim.lsp.buf.implementation, opts)
            end
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.bashls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.ast_grep.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.docker_compose_language_service.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.dockerls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.htmx.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.terraformls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.tailwindcss.setup({
                filetypes = {
                    "html",
                    "tmpl",
                },
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.ansiblels.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "yaml.ansible" },
                settings = {
                    ansible = {
                        ansible = {
                            path = "~/work/it-ansible/ansible.venv/bin/ansible"
                        },
                        python = {
                            activationScript = "/Users/lampros/work/it-ansible/ansible.venv/bin/activate",
                        },
                    },
                },
            })

            --            lspconfig.ansiblels.setup({
            --                filetypes = { "yaml" },
            --                --root_dir = require('lspconfig').util.find_git_ancestor,
            --                settings = {
            --                    ansible = {
            --                        ansible = {
            --                            path = "~/work/it-ansible/ansible.venv/bin/ansible", -- Optional, specify custom ansible binary if needed
            --                        },
            --                        executionEnvironment = {
            --                            enabled = false, -- Set to true if using an execution environment
            --                        },
            --                        python = {
            --                            interpreterPath = "~/work/it-ansible/ansible.venv/bin/python", -- Use the correct Python interpreter
            --                        },
            --                    },
            --                },
            --            })
            lspconfig.yamlls.setup({
                cmd = { "yaml-language-server", "--stdio" },
                filetypes = { "yaml" },
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yml",
                            ["https://json.schemastore.org/github-action.json"] = ".github/action.yml",
                            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { ".gitlab-ci.yml", "ci/*.yml" },
                            ["kubernetes"] = "kubernetes/**/*.yaml",
                        }
                    }
                }
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
