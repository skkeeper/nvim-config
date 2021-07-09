local map = require("config/utils").map

local M = {}

M.keybindings = function()
    map("n", "<leader>gs", ":G<CR>")
    map("n", "<leader>gj", ":diffget //3<CR>")
    map("n", "<leader>gf", ":diffget //2<CR>")
    map("n", "<leader>gr", ":Gremove<CR>")
    map("n", "<leader>gh", ":Git push<CR>")
    map("n", "<leader>gc", ":Git commit<CR>")
    map("n", "<leader>gd", ":Git difftool<CR>")
    map("n", "<leader>gp", ":Git pull<CR>")
    map("n", "<leader>gl", ":Git log<CR>")

    map("n", "<localleader>d", ":Gdiffsplit<CR>")
    map("n", "<localleader>b", ":Gblame<CR>")
    map("n", "<localleader>l", ":0Gclog<CR>")
end

return M
