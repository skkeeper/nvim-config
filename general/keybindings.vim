let g:mapleader = "\\"
let g:maplocalleader = ' '

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Buffers
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>x :bclose<CR>
nnoremap <leader>o :Bonly<CR>

" Quickfix
nnoremap <leader>cf :cfirst<CR>
nnoremap <leader>cl :clast<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>

nnoremap ,e :e **/*<C-z><S-Tab>
nnoremap ,f :find **/*<C-z><S-Tab>
"nnoremap ,b :Buffers<CR>
"nnoremap ,t :Tags<CR>

" netrw
nnoremap <leader>e :Explore<CR>
nnoremap <leader>pe :Explore .<CR>

