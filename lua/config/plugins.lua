-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- Packer config
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function()

    use {'wbthomason/packer.nvim', opt = true}

    use 'kyazdani42/nvim-web-devicons'
    use {
        'rbgrouleff/bclose.vim',
        config = function()
            require("config/bclose")
        end
    }
    use 'editorconfig/editorconfig-vim'
    use 'b3nj5m1n/kommentary'
    use 'justinmk/vim-sneak'
    use 'unblevable/quick-scope'
    use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key', config='require("plugin_settings.whichkey")'},
        config = function()
            require("config/vim-which-key").config()
        end
    }
    use 'wellle/targets.vim'
    use 'romainl/vim-qf'
    use 'vim-scripts/BufOnly.vim'
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("config/indent-blankline").config()
        end
    }

    use { 'nvim-telescope/telescope.nvim', 
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim'
        },
        config = function()
            require("config/telescope").config()
        end
    }

    -- git
    use 'tpope/vim-fugitive'
    use 'idanarye/vim-merginal'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("config/gitsigns").config()
        end
    }
    use 'junegunn/gv.vim'
    use {'sindrets/diffview.nvim', disable = true}

    -- language features
    -- use {'neoclide/coc.nvim', branch='release'}
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("config/lspconfig").config()
        end
    }
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require("config/lspsaga").config()
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('config/nvim-treesitter').config()
        end
    }
    use {
        'nvim-lua/completion-nvim',
        config = function()
            require('config/completion-nvim').config()
        end
    }
    -- use 'sheerun/vim-polyglot'
    use 'alvan/vim-closetag'
    use 'Valloric/MatchTagAlways'
    -- use 'andreshazard/vim-freemarker' -- ftl syntax support

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("config/symbols-outline").config()
        end
    }
    -- web
    use {'prettier/vim-prettier', run= 'npm install' }
    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup{}
            vim.cmd("ColorizerAttachToBuffer")
            vim.cmd("ColorizerReloadAllBuffers")
        end
    }
    use 'vim-test/vim-test'

    -- lightline
    use 'itchyny/lightline.vim'
    use 'albertomontesg/lightline-asyncrun'
    use 'mengelbrecht/lightline-bufferline'
    -- use 'josa42/vim-lightline-coc'

    -- colorschemes
    --[[ use {'dracula/vim', as= 'dracula' }
    use 'sainnhe/sonokai' ]]
    use 'folke/tokyonight.nvim'    


    -- misc
    use 'vimwiki/vimwiki'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end
    }
    use {
        'dbeniamine/cheat.sh-vim',
        config = function()
            require('config/cheatsh-vim').config()
        end,
        disable = true
    }
    use 'tpope/vim-dispatch'
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("config/nvim-tree").config()
        end
    }
    use 'bayne/vim-dot-http'

    end,
{
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    } 
})
