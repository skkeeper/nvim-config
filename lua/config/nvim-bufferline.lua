local map = require("config/utils").map
local M = {}

M.config = function()
    require("bufferline").setup{
        options = {
            show_buffer_close_icons = false,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or "" )
                    s = s .. n .. sym
                end
                return s
            end
        }
    }
end

M.keybindings = function()
    map("n", "<leader>j", ":BufferLineCycleNext<CR>")
    map("n", "<leader>k", ":BufferLineCyclePrev<CR>")
end

return M
