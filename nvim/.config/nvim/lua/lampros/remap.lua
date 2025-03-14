vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "zz", "ZZ")
-- vim.keymap.set("n", "zq", "ZQ")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n","<leader>td","<cmd>split todo.md<CR>")
vim.keymap.set("n","td",":if expand('%:t') == 'todo.md' | wq | endif<CR>",{noremap = true, silent = true })


vim.keymap.set({"n","v"}, "<leader>d",[["_d]])
vim.keymap.set("x","<leader>p",[["_dP]])

vim.keymap.set("n","<leader>x","<cmd>!chmod +x %<CR>",{silent = true})
