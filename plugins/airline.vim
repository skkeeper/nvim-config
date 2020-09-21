let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='onedark'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#branch#displayed_head_limit = 32
" remove the filetype part
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = airline#section#create(['linenr', ':%c '])
" remove separators for empty sections
let g:airline_skip_empty_sections = 1
