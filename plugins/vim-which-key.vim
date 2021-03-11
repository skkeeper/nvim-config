nnoremap <silent> <leader>      :<c-u>WhichKey '<Bslash>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

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

let g:which_key_map.c = { 'name': 'quickfix' }
let g:which_key_map.c.f = "First"
let g:which_key_map.c.l = "Last"
let g:which_key_map.c.n = "Next"
let g:which_key_map.c.p = "Previous"

let g:which_key_map.e = "Explore current directory"

let g:which_key_map.p = {'name': 'which_key_ignore'}
let g:which_key_map.ps = "Project Search"
let g:which_key_map.pe = "Project Explore"
let g:which_key_map.pb = "Git branches (telescope)"
let g:which_key_map.pc = "Git commits (telescope)"
let g:which_key_map.pf = "Buffer Git commits (telescope)"
let g:which_key_map.ph = "Git status (telescope)"


let g:which_key_map.d = {'name': 'which_key_ignore'}
let g:which_key_map.ds = "Search Dot Files"


let g:which_localkey_map = {}
let g:which_localkey_map.f = "Format"
let g:which_localkey_map.s = "Sneak"
let g:which_localkey_map.S = "Sneak backwards"
let g:which_localkey_map['#'] = "Symbols"
let g:which_localkey_map.a = "Code action selection"
let g:which_localkey_map.ac = "Code action"
let g:which_localkey_map.acp = "Code action on paragraph"
let g:which_localkey_map.b = "Git blame"
let g:which_localkey_map.d = "Git diff split"
let g:which_localkey_map.g = "CoC diagnostics"
let g:which_localkey_map.o = "Outline"
let g:which_localkey_map.c = {'name': 'Location list'}
let g:which_localkey_map.c.c = "Close"
let g:which_localkey_map.c.f = "First"
let g:which_localkey_map.c.l = "Last"
let g:which_localkey_map.c.n = "Next"
let g:which_localkey_map.c.o = "Open"
let g:which_localkey_map.c.p = "Previous"


" Register which key map
call which_key#register("\<Bslash>", "g:which_key_map")
call which_key#register("\<Space>", "g:which_localkey_map")
