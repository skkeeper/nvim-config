local saga = require 'lspsaga'
local map = require("config/utils").map

local M = {}

M.config = function()
    saga.init_lsp_saga {
        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',
        border_style = "round",
    }
end

M.keybindings = function()
    map("n", "K", ":Lspsaga hover_doc<CR>")
    map("n", "<C-k>", "<Cmd>Lspsaga signature_help<CR>")
    map("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>")

    map("n", "<localleader>ac", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
    map("v", "<localleader>ac", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
    map("n", "<f2>", "<cmd>lua require('lspsaga.rename').rename()<CR>")
    map("n", "<localleader>ap", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
end

return M
