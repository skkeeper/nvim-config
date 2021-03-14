if has("nvim")
   lua require('skkeeper/plugins')
endif

runtime! general/**.vim

if has("nvim")
   runtime! plugins/**.vim
endif



