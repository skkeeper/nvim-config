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
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'

call plug#end()

source <sfile>:h/airline.vim
source <sfile>:h/bclose.vim
source <sfile>:h/nerdcommenter.vim
source <sfile>:h/coc.vim
source <sfile>:h/fzf.vim
source <sfile>:h/MatchTagAlways.vim
source <sfile>:h/quickscope.vim
source <sfile>:h/ripgrep.vim
source <sfile>:h/sneak.vim
source <sfile>:h/vim-close-tag.vim
source <sfile>:h/vim-jsx-pretty.vim
source <sfile>:h/vim-which-key.vim
