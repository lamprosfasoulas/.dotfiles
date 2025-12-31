local keymap = vim.keymap
local cmd = vim.cmd
vim.g.mapleader = " "

keymap.set("n", "<leader>pv", cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n","<C-d>","<C-d>zz")
keymap.set("n","<C-u>","<C-u>zz")

keymap.set({"n", "v"}, "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- keymap.set("n", "zz", "ZZ")
-- keymap.set("n", "zq", "ZQ")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n","<leader>td","<cmd>split todo.md<CR>")
keymap.set("n","td",":if expand('%:t') == 'todo.md' | wq | endif<CR>",{noremap = true, silent = true })

-- Scroll up
keymap.set("n", "<A-y>", "<C-y>")
-- Scroll down
keymap.set("n", "<C-y>", "<C-e>")

keymap.set({"n","v"}, "<leader>d",[["_d]])
keymap.set("x","<leader>p",[["_dP]])

keymap.set("n","<leader>x","<cmd>!chmod +x %<CR>",{silent = true})

-- Lua Exec Remaps
keymap.set("n","<leader><leader>l",":source %<CR>")
keymap.set("n","<leader>l",":.lua<CR>")
keymap.set("v","<leader>l",":lua<CR>")
