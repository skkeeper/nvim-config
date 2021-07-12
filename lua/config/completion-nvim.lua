local map = require("config/utils").map

local M = {}

M.config = function()
    -- vim.g.completion_enable_auto_popup = 1
end

M.keybindings = function()
    vim.cmd([[
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    ]])
end

return M
