let g:which_key_map = {
      \ 'c' : ['<Plug>NERDCommenterToggle', 'comment'],
	  \ 'j' : [':bnext',                    'Buffer: Next'],
	  \ 'k' : [':bprevious',                'Buffer: Previous'],
	  \ 'ps': ['\<Bslash>ps',               'Project search'],
	  \ 'x' : [':Bclose',                   'Buffer: Close'],
      \ }

let g:which_localkey_map = {}


" Register which key map
call which_key#register("\<Bslash>", "g:which_key_map")
"call which_key#register("\<Space>", "g:which_localkey_map")