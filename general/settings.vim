set cindent
set colorcolumn=80
set clipboard=unnamedplus
set expandtab
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=20
set hidden
set ignorecase
set incsearch
set mouse=a
set nowrap
set number
set path-=/usr/include
set shiftwidth=2
set smartcase
set smarttab
set spell
" set spellfile=spell/pt-preao.utf-8.add
set spelllang=en_us
set tabstop=2
set wildignore+=node_modules/**,.git/**,.settings/**,.mvn/**
set wildcharm=<C-z>

set title "set window title
set noshowmode "hide mode because airline already shows it

syntax enable
if (has("termguicolors"))
  set termguicolors
endif

try
  let ayucolor="dark" 
  colorscheme ayu
catch
endtry


