" VimPlug {{{
call plug#begin('~/.vim/plugged')

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'cage1618/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" misc
Plug 'rbgrouleff/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'jremmen/vim-ripgrep' "install ripgrep

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

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

" }}}


" NERDTree {{{

let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeGitStatusNodeColorization = 1

nmap <C-n> :NERDTreeToggle<CR>
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" ctrlp {{{
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader><Tab> :CtrlPBuffer<CR>
" }}}

" ripgrep {{{
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <Leader>ps :Rg<SPACE>
" }}}

" airline {{{
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='onedark'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_tab_type = 0
" }}}

" CoC {{{

let g:coc_global_extensions = [
   \ 'coc-snippets',
   \ 'coc-pairs',
   \ 'coc-tsserver',
   \ 'coc-eslint', 
   \ 'coc-prettier', 
   \ 'coc-json', 
   \ 'coc-git',
   \ 'coc-highlight'
   \ ]

source <sfile>:h/coc-settings.vim

" }}}

" vim-jsx-pretty {{{
let g:vim_jsx_pretty_highlight_close_tag = 0
let g:vim_jsx_pretty_colorful_config = 1
" }}}

" vim-closetag {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
" }}}

" MatchTagAlways {{{
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascriptreact': 1
    \}
" }}}

" VIMRC {{{
set cindent
set colorcolumn=80
set expandtab
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=9
set hidden
set incsearch
set nowrap
set number
set path+=**
set shiftwidth=2
set smarttab
set tabstop=2
set wildignore+=**/node_modules/**
syntax enable
if (has("termguicolors"))
  set termguicolors
endif

colorscheme dracula

" buffer mappings
let g:bclose_no_plugin_maps = 1
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>x :Bclose<CR>

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}

" vim:foldmethod=marker:foldlevel=0
