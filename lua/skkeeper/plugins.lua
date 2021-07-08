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
use {'wbthomason/packer.nvim', opt = true}

use 'kyazdani42/nvim-web-devicons'
use 'rbgrouleff/bclose.vim'
use 'editorconfig/editorconfig-vim'
--use 'tpope/vim-commentary'
use 'b3nj5m1n/kommentary'
use 'justinmk/vim-sneak'
use 'unblevable/quick-scope'
use 'liuchengxu/vim-which-key'
use 'wellle/targets.vim'
use 'romainl/vim-qf'
use 'vim-scripts/BufOnly.vim'

use { 'nvim-telescope/telescope.nvim', requires = { 
  'nvim-lua/popup.nvim', 
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope-fzy-native.nvim'
  } 
}

use 'mcchrish/nnn.vim'

-- git
use 'tpope/vim-fugitive'
use 'idanarye/vim-merginal'
--use 'mhinz/vim-signify'
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  }
}
use 'junegunn/gv.vim'
use 'sindrets/diffview.nvim'

-- language features
use {'neoclide/coc.nvim', branch='release'}
use 'sheerun/vim-polyglot'
use 'alvan/vim-closetag'
use 'Valloric/MatchTagAlways'
use 'andreshazard/vim-freemarker' -- ftl syntax support
-- web
use {'prettier/vim-prettier', run= 'npm install' }
use 'ap/vim-css-color'
use 'vim-test/vim-test'

-- lightline
use 'itchyny/lightline.vim'
use 'albertomontesg/lightline-asyncrun'
use 'mengelbrecht/lightline-bufferline'
use 'josa42/vim-lightline-coc'

-- colorschemes
use {'dracula/vim',  as= 'dracula' }

-- misc
use 'Yggdroot/indentLine'
use 'dbeniamine/cheat.sh-vim'
use 'vimwiki/vimwiki'
use 'tpope/vim-dispatch'

end)
