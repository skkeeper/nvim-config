call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
"Plug 'rbgrouleff/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'scrooloose/nerdcommenter'
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

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'

" language features
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'andreshazard/vim-freemarker' " ftl syntax support

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

call plug#end()
