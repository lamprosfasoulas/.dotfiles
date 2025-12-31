return {
    {
        'saghen/blink.cmp',
        version = 'v0.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        opts = {
            keymap = {
                ['<C-j>'] = { 'select_next' },
                ['<C-k>'] = { 'select_prev' },
                ['<C-d>'] = { 'scroll_documentation_down' },
                ['<C-u>'] = { 'scroll_documentation_up' },

                ['<C-b>'] = { 'show_documentation' },

                ['<C-Space>'] = { 'show' },
                ['<C-e>'] = { 'cancel' },
                ['<CR>'] = { 'accept', 'fallback' },

                ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
            },
            -- completion = {
            --     documentation = { auto_show = true },
            -- },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',
            },

            signature = { enabled = false },
        },
    },
}
