let g:mapleader = "\\"
let g:maplocalleader = ' '


"nnoremap <C-p> :Files<CR>
"nnoremap <Leader>ps :RG<CR>

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

" Quickfix
nnoremap <leader>cf :cfirst<CR>
nnoremap <leader>cl :clast<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>

nnoremap <silent> <leader>      :<c-u>WhichKey '<Bslash>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

nnoremap ,e :e **/*<C-z><S-Tab>
nnoremap ,f :find **/*<C-z><S-Tab>
"nnoremap ,b :Buffers<CR>
"nnoremap ,t :Tags<CR>

" netrw
nnoremap <leader>e :Explore<CR>
nnoremap <leader>pe :Explore .<CR>

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

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap ,b <cmd>Telescope buffers<cr>
nnoremap ,t <cmd>Telescope tags<cr>
nnoremap ,q :lua require'telescope.builtin'.quickfix{}<cr>
nnoremap ,c :lua require'telescope.builtin'.command_history{}<cr>
nnoremap <leader>pc :lua require'telescope.builtin'.git_commits{}<cr>
nnoremap <leader>pf :lua require'telescope.builtin'.git_bcommits{}<cr>
nnoremap <leader>pb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>ph :lua require'telescope.builtin'.git_status{}<cr>

