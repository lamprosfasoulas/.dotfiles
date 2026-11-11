return {
    {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("gitsigns").setup{
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
                current_line_blame = false,
            }
            local gs = package.loaded.gitsigns
            vim.keymap.set('n', '<leader>bl', gs.toggle_current_line_blame)
            --vim.keymap.set('n', '<leader>ff', gs.diffthis)

            vim.keymap.set('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gs.nav_hunk('next', { target = 'all', wrap = true })
                end
            end, { desc = 'Next hunk' })

            vim.keymap.set('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gs.nav_hunk('next', { target = 'all', wrap = true })
                end
            end, { desc = 'Next hunk' })

        end
    },

}
