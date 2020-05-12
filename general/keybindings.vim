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

nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>x :Bclose<CR>

nnoremap <silent> <leader>      :<c-u>WhichKey '<Bslash>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

nmap <leader>c <Plug>NERDCommenterToggle