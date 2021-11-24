local M = {}

M.config = function()
    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = {},
        },
        indent = {
            enable = false,
            disable = {},
        },
        ensure_installed = {
            "tsx",
            "javascript",
            "toml",
            "json",
            "yaml",
            "html",
            "scss",
            "lua"
        },
        autopairs = {
            enable = true
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                scope_incremental = 'grn',
                node_incremental = 'grc',
                node_decremental = 'grm',
            }
        }
    }
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
end

return M
