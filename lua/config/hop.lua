local map = require("config/utils").map

local M = {}

M.config = function()
    require'hop'.setup {}
end

M.keybindings = function()
    map("n", "s", "<cmd>HopChar1AC<CR>", { noremap=true, silent=true })
    map("n", "S", "<cmd>HopChar1BC<CR>", { noremap=true, silent=true })
    map("o", "s", "v<cmd>HopChar1AC<CR>", { noremap=true, silent=true })
    map("o", "S", "v<cmd>HopChar1BC<CR>", { noremap=true, silent=true })
    map("v", "s", "<cmd>HopChar1AC<CR>", { noremap=true, silent=true } )
    map("v", "S", "<cmd>HopChar1BC<CR>", { noremap=true, silent=true } )
end

return M
