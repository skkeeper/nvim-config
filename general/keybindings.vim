let g:mapleader = "\\"
let g:maplocalleader = ' '


nnoremap <C-p> :Files<CR>
nnoremap <Leader>ps :RG<CR>

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" 2-character Sneak (default)
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
" visual-mode
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
" operator-pending-mode
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

" Buffers
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>x :bdelete<CR>
nnoremap <leader>o :Bonly<CR>

nnoremap <silent> <leader>      :<c-u>WhichKey '<Bslash>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

nmap <leader>c <Plug>NERDCommenterToggle

nnoremap ,e :e **/*<C-z><S-Tab>
nnoremap ,f :find **/*<C-z><S-Tab>

" Fugitive (git)
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gr :Gremove<CR>
nmap <leader>gh :Gpush<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gd :Git difftool<CR>
nmap <leader>gp :Gpull<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gb :GBranches<CR>
nmap <leader>gt :GTags<CR>
