local M = {}

M.config = function()
    require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt" , "vim" },
    })
    require("nvim-autopairs.completion.compe").setup(
        {
            map_cr = true,
            map_complete = true -- insert () func completion
        }
    )
end

return M
