let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'
set showtabline=2
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#enable_nerdfont=1
let g:lightline#bufferline#clickable=1

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \	    ['fileformat', 'fileencoding', 'filetype'],
      \     ['coc_status', 'asyncrun_status'],
      \   ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ], 'right': [['']]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'asyncrun_status': 'lightline#asyncrun#status',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_raw' : { 'buffers': 1 }
      \ }

call lightline#coc#register()
