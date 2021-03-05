let g:prettier#exec_cmd_async = 1

nmap <Leader>f <Plug>(Prettier)

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
