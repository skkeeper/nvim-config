local saga = require 'lspsaga'
local map = require("config/utils").map
local lsp = vim.lsp
local handlers = lsp.handlers

local M = {}

M.config = function()
    saga.init_lsp_saga {
        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',
        border_style = "round",
    }

    local pop_opts = { border = "rounded", max_width = 80 }
    handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
    handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)
end

M.keybindings = function()
    map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
    map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
    map("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>")

    map("n", "<localleader>ac", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
    map("v", "<localleader>ac", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
    map("n", "<f2>", "<cmd>lua require('lspsaga.rename').rename()<CR>")
    map("n", "<localleader>ap", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
    map("n", "<localleader>ag", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
end

return M
