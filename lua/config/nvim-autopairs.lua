local M = {}

M.config = function()
    require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt" , "vim" },
    })
end

return M
