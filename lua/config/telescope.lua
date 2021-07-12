local map = require("config/utils").map
local trouble = require("trouble.providers.telescope")

local M = {}

local actions = require('telescope.actions')
require('telescope').load_extension('fzy_native')
M.config = function()
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = ' >',
            color_devicons = true,

            file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},

            mappings = {
                i = {
                    ["<C-x>"] = false,
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<C-t>"] = trouble.open_with_trouble
                },
                n = {
                    ["<C-t>"] = trouble.open_with_trouble
                }
            }
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        }
    }
end

M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

M.keybindings = function()
    map("n", "<C-p>",[[<Cmd> Telescope git_files<CR>]])
    map("n", "<leader>ps",[[<Cmd> Telescope live_grep<CR>]])
    map("n", ",b",[[<Cmd> Telescope buffers<CR>]])
    map("n", ",t",[[<Cmd> Telescope tags<CR>]])
    map("n", ",q",[[<Cmd> Telescope quickfix<CR>]])
    map("n", ",c",[[<Cmd> Telescope command_history<CR>]])

    map("n", "<leader>pc",[[<Cmd> Telescope git_commits<CR>]])
    map("n", "<leader>pf",[[<Cmd> Telescope git_bcommits<CR>]])
    map("n", "<leader>pb",[[<Cmd> Telescope git_branches<CR>]])
    map("n", "<leader>ph",[[<Cmd> Telescope git_status<CR>]])

    map("n", "<leader>ds",[[<Cmd>lua require('config.telescope').search_dotfiles()<CR>]])
end

return M
