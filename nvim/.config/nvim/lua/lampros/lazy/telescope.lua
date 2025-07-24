return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local telescope = require "telescope"
        local actions = require "telescope.actions"
	    telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            },
        })

	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n','<leader>pf',builtin.find_files,{})
        vim.keymap.set('n','<leader>pe', builtin.diagnostics,{})
	    vim.keymap.set('n','<C-p>',builtin.git_files,{})
	    vim.keymap.set('n','<leader>ps', function()
		    builtin.grep_string({ search = vim.fn.input("Grep > ")})
		end)
	    vim.keymap.set('n','<leader>pws', function()
		    builtin.grep_string({ search = vim.fn.expand("<cword>")})
		end)
        vim.keymap.set('n','<leader>vh',builtin.help_tags,{})

	end
}
