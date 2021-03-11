let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:indentLine_concealcursor = ''
augroup FILETYPES
  autocmd FileType markdown let b:indentLine_enabled = 0
augroup END
