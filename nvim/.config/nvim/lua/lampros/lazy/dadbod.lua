return {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    {
        "kristijanhusak/vim-dadbod-ui",
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "dbout",
                callback = function()
                    vim.wo.foldenable = false
                end
            })
        end
    }
}
