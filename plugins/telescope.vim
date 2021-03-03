lua require("skkeeper/telescope")

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap ,b <cmd>Telescope buffers<cr>
nnoremap ,t <cmd>Telescope tags<cr>
nnoremap ,q :lua require'telescope.builtin'.quickfix{}<cr>
nnoremap ,c :lua require'telescope.builtin'.command_history{}<cr>
nnoremap <leader>pc :lua require'telescope.builtin'.git_commits{}<cr>
nnoremap <leader>pf :lua require'telescope.builtin'.git_bcommits{}<cr>
nnoremap <leader>pb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>ph :lua require'telescope.builtin'.git_status{}<cr>
