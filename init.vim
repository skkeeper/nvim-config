
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" VimPlug {{{

call plug#begin('~/.vim/plugged')

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'cage1618/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'ObserverOfTime/coloresque.vim'
Plug 'majutsushi/tagbar'
Plug 'rbgrouleff/bclose.vim'

" language features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'


Plug 'jremmen/vim-ripgrep' "install ripgrep
Plug 'tpope/vim-fugitive'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'


call plug#end()

" }}}



" buffer mappings
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
let g:bclose_no_plugin_maps = 1
nnoremap <leader>x :Bclose<CR>

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
let g:airline_theme='onedark'
let g:airline#extensions#hunks#non_zero_only = 1
" }}}

" CoC {{{

" coc config
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

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>coc-implementation)(
nmap <silent> gr <Plug>(coc-references))

" Press K to show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
    else
          call CocAction('doHover')
    endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>f :Prettier<CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" }}}

" VIMRC {{{
set hidden
set nowrap
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80
set incsearch
set number
syntax enable
if (has("termguicolors"))
  set termguicolors
endif

colorscheme dracula

set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=5

" }}}


" vim:foldmethod=marker:foldlevel=0
