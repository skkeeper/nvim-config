set hidden
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80
set incsearch
set number

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ============================================================================
" === VimPlug                                                              ===
" ============================================================================
call plug#begin('~/.vim/plugged')

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ObserverOfTime/coloresque.vim'

" language features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


Plug 'jremmen/vim-ripgrep' "install ripgrep
Plug 'tpope/vim-fugitive'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'

call plug#end()

colorscheme gruvbox
set background=dark

" buffer mappings
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>x :bdelete<CR>


" ============================================================================
" === NERDTree                                                             ===
" ============================================================================
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction
nmap <C-n> :call ToggleNerdTree()<CR>




" ============================================================================
" === ctrlp                                                                ===
" ============================================================================
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader><Tab> :CtrlPBuffer<CR>


" ============================================================================
" === ripgrep                                                              ===
" ============================================================================
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <Leader>ps :Rg<SPACE>


" ============================================================================
" === airline                                                              ===
" ============================================================================
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:airline#extensions#hunks#enabled=0


" ============================================================================
" === coc                                                                  ===
" ============================================================================

" coc config
let g:coc_global_extensions = [
   \ 'coc-snippets',
   \ 'coc-pairs',
   \ 'coc-tsserver',
   \ 'coc-eslint', 
   \ 'coc-prettier', 
   \ 'coc-json', 
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
