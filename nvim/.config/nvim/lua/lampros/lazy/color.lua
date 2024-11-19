return{
    --[[
    {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup()
        vim.cmd.colorscheme "tokyonight-storm"
    end
    },
    {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup()
        vim.cmd.colorscheme "catppuccin-macchiato"
    end
    },
    {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
        require("rose-pine").setup()
        vim.cmd.colorscheme "rose-pine"
    end
    }
    --]]
    {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.everforest_background = 'hard'
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
      end
    },
}
