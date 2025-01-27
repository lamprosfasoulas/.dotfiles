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
        end
    },

}
