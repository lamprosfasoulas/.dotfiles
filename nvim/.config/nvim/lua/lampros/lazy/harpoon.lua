return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = false,
        config = function()
            local harpoon = require("harpoon")

            harpoon.setup({
                global_settings = {
                    -- saves the harpoon file upon every change. disabling is unrecommended.
                    save_on_change = true,
                    -- filetypes that you want to prevent from adding to the harpoon list menu.
                    excluded_filetypes = { "harpoon" },
                    -- set marks specific to each git branch inside git repository
                    mark_branch = false,
                    -- enable tabline with harpoon marks
                    tabline = true,
                    tabline_prefix = "   ",
                    tabline_suffix = "   ",
                }
            })

            vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-b>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-b>", function() harpoon:list():replace_at(4) end)
        end
    },
}
