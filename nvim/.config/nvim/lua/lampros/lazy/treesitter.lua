return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "svelte", "javascript", "typescript", "html", "css" },
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'svelte' },
            callback = function() vim.treesitter.start() end,
        })
    end
}
