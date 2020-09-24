"let g:which_key_map = {
"      \ 'c' : ['<Plug>NERDCommenterToggle', 'comment'],
"  	  \ 'j' : [':bnext',                    'Buffer: Next'],
"	    \ 'k' : [':bprevious',                'Buffer: Previous'],
"	    \ 'x' : [':Bclose',                   'Buffer: Close'],
"      \ }
let g:which_key_map =  {}
let g:which_key_map.j = "Buffer: Next"
let g:which_key_map.k = "Buffer: Previous"
let g:which_key_map.x = "Buffer: Close"
let g:which_key_map.o = "Buffer: Close others"

let g:which_key_map.g = { 'name': 'Git' }
let g:which_key_map.g.s = "Status"
let g:which_key_map.g.d = "Diff List"
let g:which_key_map.g.j = "Use Left Diff"
let g:which_key_map.g.f = "Use Right Diff"
let g:which_key_map.g.h = "Push"
let g:which_key_map.g.p = "Pull"
let g:which_key_map.g.c = "Commit"
let g:which_key_map.g.r = "Remove"
let g:which_key_map.g.l = "Log"
let g:which_key_map.g.b = "Branches"
let g:which_key_map.g.t = "Tags"

let g:which_key_map.e = "Explore current directory"

let g:which_key_map.p = {'name': 'which_key_ignore'}
let g:which_key_map.ps = "Project Search"
let g:which_key_map.pe = "Project Explore"

let g:which_localkey_map = {}


" Register which key map
call which_key#register("\<Bslash>", "g:which_key_map")
call which_key#register("\<Space>", "g:which_localkey_map")
