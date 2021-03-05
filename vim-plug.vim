call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'rbgrouleff/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep' "install ripgrep
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'liuchengxu/vim-which-key' 
Plug 'wellle/targets.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-qf'
Plug 'vim-scripts/BufOnly.vim'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'mcchrish/nnn.vim' "install nnn

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'

" language features
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'andreshazard/vim-freemarker' " ftl syntax support
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'ap/vim-css-color'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

" misc
Plug 'Yggdroot/indentLine'
Plug 'guns/xterm-color-table.vim'
Plug 'dbeniamine/cheat.sh-vim'

call plug#end()
