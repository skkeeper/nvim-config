let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" imediately move tot the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" Change the colors
"highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
"highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
let g:sneak#prompt = '🔍 '
"let g:sneak#prompt = '🕵️ '

" 2-character Sneak (default)
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
" visual-mode
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
" operator-pending-mode
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

