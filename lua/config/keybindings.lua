local map = require("config/utils").map

local g = vim.g

g.mapleader = "\\"
g.maplocalleader = " "

map("n", ",e", ":e **/*<C-z><S-Tab>")
map("n", ",f", ":find **/*<C-z><S-Tab>")

-- netrw
map("n", "<leader>e", ":Explore<CR>")
map("n", "<leader>pe", ":Explore .<CR>")


-- move lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- buffers
map("n", "<leader>j", ":bnext<CR>")
map("n", "<leader>k", ":bprevious<CR>")
map("n", "<leader>x", ":Bclose<CR>")
map("n", "<leader>o", ":Bonly<CR>")

-- quickfix
map("n", "<leader>co", ":copen<CR>")
map("n", "<leader>cf", ":cfirst<CR>")
map("n", "<leader>cl", ":clast<CR>")
map("n", "<leader>cn", ":cnext<CR>")
map("n", "<leader>cp", ":cprevious<CR>")
map("n", "<leader>cc", ":cclose<CR>")

-- location list
map("n", "<localleader>co", ":lopen<CR>")
map("n", "<localleader>cf", ":lfirst<CR>")
map("n", "<localleader>cl", ":llast<CR>")
map("n", "<localleader>cn", ":lnext<CR>")
map("n", "<localleader>cp", ":lprevious<CR>")
map("n", "<localleader>cc", ":lclose<CR>")


-- plugins
require("config/fugitive").keybindings()
require("config/nvim-tree").keybindings()
require("config/telescope").keybindings()
require("config/lspsaga").keybindings()
require("config/symbols-outline").keybindings()
require("config/compe").keybindings();
