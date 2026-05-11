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
                    "lua_ls", "bashls", "ast_grep", "gopls", "rust_analyzer",
                    "yamlls", "docker_compose_language_service", "dockerls",
                    "ts_ls", "html", "tailwindcss", "terraformls",
                    "intelephense", "pyright", "jdtls", "svelte", "ansiblels",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local on_attach = function(_, bufnr)
                vim.keymap.set("n", "L", vim.lsp.buf.implementation,
                    { noremap = true, silent = true, buffer = bufnr })
            end

            local base = { capabilities = capabilities, on_attach = on_attach }

            -- Servers that need no extra config beyond base
            local servers = {
                "pyright", "lua_ls", "bashls", "ast_grep", "rust_analyzer",
                "docker_compose_language_service", "dockerls", "ts_ls", "htmx",
                "terraformls", "html", "intelephense", "jdtls", "svelte",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, base)
            end

            -- Servers with extra settings — vim.lsp.config deep-merges on repeated calls
            vim.lsp.config("gopls", vim.tbl_deep_extend("force", base, {
                settings = {
                    gopls = {
                        ["ui.semanticTokens"] = true,
                        completeUnimported = true,
                        usePlaceholders = false,
                        staticcheck = true,
                        analyses = { unusedparams = true },
                    },
                },
            }))

            vim.lsp.config("tailwindcss", vim.tbl_deep_extend("force", base, {
                filetypes = { "html", "tmpl" },
            }))

            vim.lsp.config("ansiblels", vim.tbl_deep_extend("force", base, {
                filetypes = { "yaml.ansible" },
                settings = {
                    ansible = {
                        ansible = {
                            path = "~/work/it-ansible/ansible.venv/bin/ansible",
                        },
                        python = {
                            activationScript = "~/work/it-ansible/ansible.venv/bin/activate",
                        },
                    },
                },
            }))

            vim.lsp.config("yamlls", vim.tbl_deep_extend("force", base, {
                cmd = { "yaml-language-server", "--stdio" },
                filetypes = { "yaml" },
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yml",
                            ["https://json.schemastore.org/github-action.json"] = ".github/action.yml",
                            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { ".gitlab-ci.yml", "ci/*.yml" },
                            ["kubernetes"] = "kubernetes/**/*.yaml",
                        },
                    },
                },
            }))

            -- Required in Neovim 0.11+: vim.lsp.config() declares, vim.lsp.enable() starts
            local extra = { "gopls", "tailwindcss", "ansiblels", "yamlls" }
            vim.lsp.enable(vim.list_extend(vim.deepcopy(servers), extra))
        end,
    },
}
