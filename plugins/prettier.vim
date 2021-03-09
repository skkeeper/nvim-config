let g:prettier#exec_cmd_async = 1

nmap <localleader>P <Plug>(Prettier)

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
