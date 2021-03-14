-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
   execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
   execute 'packadd packer.nvim'
end

-- Config
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
-- Packer can manage itself as an optional plugin
use {'wbthomason/packer.nvim', opt = true}

use 'ryanoasis/vim-devicons'
use 'rbgrouleff/bclose.vim'
use 'editorconfig/editorconfig-vim'
use 'tpope/vim-commentary'
use 'justinmk/vim-sneak'
use 'unblevable/quick-scope'
use 'liuchengxu/vim-which-key'
use 'wellle/targets.vim'
use 'romainl/vim-qf'
use 'vim-scripts/BufOnly.vim'

use 'tmux-plugins/vim-tmux-focus-events'

use { 'nvim-telescope/telescope.nvim', requires = { 
  'nvim-lua/popup.nvim', 
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope-fzy-native.nvim'
  } 
}

use 'mcchrish/nnn.vim'

-- git
use 'tpope/vim-fugitive'
use 'mhinz/vim-signify'
use 'junegunn/gv.vim'

-- language features
use {'neoclide/coc.nvim', branch='release'}
--use 'sheerun/vim-polyglot'
use 'OmniSharp/omnisharp-vim'
use 'alvan/vim-closetag'
use 'Valloric/MatchTagAlways'
use 'andreshazard/vim-freemarker' -- ftl syntax support
use {'prettier/vim-prettier', run= 'npm install' }
use 'ap/vim-css-color'

-- lightline
use 'itchyny/lightline.vim'
use 'albertomontesg/lightline-asyncrun'
use 'mengelbrecht/lightline-bufferline'
use 'josa42/vim-lightline-coc'

-- colorschemes
use 'morhetz/gruvbox'
use 'liuchengxu/space-vim-dark'
use {'dracula/vim',  as= 'dracula' }
use 'jaredgorski/spacecamp'
use 'joshdick/onedark.vim'
use 'ayu-theme/ayu-vim'
use 'colepeters/spacemacs-theme.vim'

-- colorschemes with treesitter
use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
use 'Th3Whit3Wolf/one-nvim'
use 'yonlu/omni.vim'
use 'ray-x/aurora'


-- misc
use 'Yggdroot/indentLine'
use 'guns/xterm-color-table.vim'
use 'dbeniamine/cheat.sh-vim'
use 'vimwiki/vimwiki'
use 'mhartington/oceanic-next'
use 'sainnhe/sonokai'

end)
