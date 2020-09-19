call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'rbgrouleff/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jremmen/vim-ripgrep' "install ripgrep
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'liuchengxu/vim-which-key' 

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'

" language features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json' " json syntax support
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'andreshazard/vim-freemarker' " ftl syntax support
Plug 'cespare/vim-toml' " toml syntax support

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'

" misc
Plug 'guns/xterm-color-table.vim'

call plug#end()
