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
                    "intelephense",
                    "pyright",
                    "jdtls",
                },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            --local capabilities = require('cmp_nvim_lsp').default_capabilities()
            --
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'L', vim.lsp.buf.implementation, opts)
            end

            local servers = {
            "pyright",
            "lua_ls",
            "bashls",
            "ast_grep",
            "rust_analyzer",
            "docker_compose_language_service",
            "dockerls",
            "ts_ls",
            "htmx",
            "terraformls",
            "html",
            "intelephense",
            "jdtls",
            "tailwindcss",
            "ansiblels",
            "yamlls",
            }

            local default_setup = function(server)
                vim.lsp.config(server, {
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end

            for _, lsp in ipairs(servers) do
                default_setup(lsp)
            end

				--         vim.lsp.config('pyright', {
				--             capabilities = capabilities,
				--             on_attach = on_attach,
				--         })
				--         vim.lsp.config('lua_ls', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('bashls', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('ast_grep', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('rust_analyzer', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('docker_compose_language_service', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('dockerls', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('ts_ls', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('htmx', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('terraformls', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('html', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('intelephense', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
				--         vim.lsp.config('jdtls', {
				-- capabilities = capabilities,
				-- on_attach = on_attach
				--         })
            vim.lsp.config('tailwindcss', {
				capabilities = capabilities,
				on_attach = on_attach,
                filetypes = { "html", "tmpl" },
            })
            vim.lsp.config('ansiblels', {
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
            vim.lsp.config('yamlls', {
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
    }
}
