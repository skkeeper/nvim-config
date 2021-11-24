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

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'kyazdani42/nvim-web-devicons'
    use {
        'rbgrouleff/bclose.vim',
        config = function()
            require("config/bclose")
        end
    }
    use 'editorconfig/editorconfig-vim'
    use 'b3nj5m1n/kommentary'
    use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
          require("config/hop").config()
      end
    }
    use {
       "folke/which-key.nvim",
        config = function()
            require("config/which-key").config()
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

    use {
        'xiyaowong/telescope-emoji.nvim',
        requires = {
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            require("telescope").load_extension("emoji")
        end
    }

    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            require('neoclip').setup()
            require('telescope').load_extension('neoclip')
        end,
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
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("config/lspconfig").config()
        end,
        requires = {
            { 'nvim-lua/lsp-status.nvim', opt = true },
        }
    }
    use {
        'kabouzeid/nvim-lspinstall',
        config = function()
            require("config/lspinstall").config()
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("config/nvim-autopairs").config()
        end
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "onsails/lspkind-nvim", 
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
        },
        config = function()
            require("config/cmp").config()
        end
    }
    use {
        'jose-elias-alvarez/nvim-lsp-ts-utils'
    }
    use {
        'tami5/lspsaga.nvim',
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
    use 'Valloric/MatchTagAlways'
    -- use 'andreshazard/vim-freemarker' -- ftl syntax support

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config/trouble").config()
        end
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("config/symbols-outline").config()
        end
    }
    -- web
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

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() 
            require('config/galaxyline')
        end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'akinsho/nvim-bufferline.lua', 
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config/nvim-bufferline').config()
        end
    }

    -- colorschemes
    use 'folke/tokyonight.nvim'    

    -- misc
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("config/todo-comments").config()
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
    use 'alexpearce/nvim-follow-markdown-links'

    end,
{
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    } 
})
