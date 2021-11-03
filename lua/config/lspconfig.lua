local M = {}

M.config = function()
    local protocol = require 'vim.lsp.protocol'
    local nvim_lsp = require('lspconfig')
    vim.cmd [[packadd lsp-status.nvim]]

    local lsp_status = require 'lsp-status'
    lsp_status.config {
        status_symbol = '',
        indicator_ok = '',
        diagnostics = false,
        current_function = false
    }
    lsp_status.register_progress()

    local capabilities = lsp_status.capabilities
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {'documentation', 'detail', 'additionalTextEdits'}
    }

    local on_attach = function(client, bufnr)
        lsp_status.on_attach(client)

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- Mappings.
        local opts = {
            noremap = true,
            silent = true
        }
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        -- formatting
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api
                .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
            vim.api.nvim_command [[augroup END]]
        end

        protocol.CompletionItemKind = {
            '', -- Text
            '', -- Method
            '', -- Function
            '', -- Constructor
            '', -- Field
            '', -- Variable
            '', -- Class
            'ﰮ', -- Interface
            '', -- Module
            '', -- Property
            '', -- Unit
            '', -- Value
            '', -- Enum
            '', -- Keyword
            '﬌', -- Snippet
            '', -- Color
            '', -- File
            '', -- Reference
            '', -- Folder
            '', -- EnumMember
            '', -- Constant
            '', -- Struct
            '', -- Event
            'ﬦ', -- Operator
            '' -- TypeParameter
        }
    end
    -- TypeScript
    nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, params, ctx, config)
                if params.diagnostics ~= nil then
                    local idx = 1
                    while idx <= #params.diagnostics do
                        -- Code list to ignore: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
                        if params.diagnostics[idx].code == 7016 then
                            table.remove(params.diagnostics, idx)
                        else
                            idx = idx + 1
                        end
                    end
                end
                vim.lsp.diagnostic.on_publish_diagnostics(_, params,
                                                          ctx, config)
            end
        }
    }

    nvim_lsp.diagnosticls.setup {
        on_attach = on_attach,
        filetypes = {
            'javascript', 'javascriptreact', 'json', 'typescript',
            'typescriptreact', 'css', 'less', 'scss', 'sass', 'markdown',
            'pandoc', 'sh'
        },
        init_options = {
            linters = {
                eslint = {
                    command = 'eslint',
                    rootPatterns = {'.git'},
                    debounce = 100,
                    args = {
                        '--stdin', '--stdin-filename', '%filepath', '--format',
                        'json'
                    },
                    sourceName = 'eslint',
                    parseJson = {
                        errorsRoot = '[0].messages',
                        line = 'line',
                        column = 'column',
                        endLine = 'endLine',
                        endColumn = 'endColumn',
                        message = '[eslint] ${message} [${ruleId}]',
                        security = 'severity'
                    },
                    securities = {
                        [2] = 'error',
                        [1] = 'warning'
                    }
                },
                markdownlint = {
                    command = 'markdownlint',
                    args = {'--stdin'},
                    isStderr = true,
                    debounce = 100,
                    offsetLine = 0,
                    offsetColumn = 0,
                    sourceName = 'markdownlint',
                    formatLines = 1,
                    formatPattern = {
                        '^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$',
                        {
                            line = 1,
                            column = 3,
                            message = {4}
                        }
                    },

                    rootPatterns = {'.git'}
                },
                stylelint = {
                    command = './node_modules/.bin/stylelint',
                    args = {
                        '--formatter', 'json', '--stdin-filename', '%filepath'
                    },
                    rootPatterns = {
                        '.stylelintrc', '.stylelintrc.js', '.stylelintrc.json',
                        '.stylelintrc.yaml', '.stylelintrc.yml',
                        'stylelint.config.js', 'stylelint.config.cjs',
                        'package.json'
                    },
                    requiredFiles = {
                        '.stylelintrc', '.stylelintrc.js', '.stylelintrc.json',
                        '.stylelintrc.yaml', '.stylelintrc.yml',
                        'stylelint.config.js', 'stylelint.config.cjs',
                        'package.json'
                    },
                    debounce = 100,
                    sourceName = 'stylelint',
                    parseJson = {
                        errorsRoot = '[0].warnings',
                        line = 'line',
                        column = 'column',
                        message = '${text}',
                        security = 'severity'
                    },
                    securities = {
                        error = 'error',
                        warning = 'warning'
                    }
                },
                shellcheck = {
                    command = 'shellcheck',
                    debounce = 100,
                    args = {'--format', 'json', '--external-sources', '-'},
                    sourceName = 'shellcheck',
                    parseJson = {
                        line = 'line',
                        column = 'column',
                        endLine = 'endLine',
                        endColumn = 'endColumn',
                        message = '${message} [${code}]',
                        security = 'level'
                    },
                    securities = {
                        error = 'error',
                        warning = 'warning',
                        info = 'info',
                        style = 'hint'
                    }
                },
                writegood = {
                    command = "write-good",
                    debounce = 100,
                    args = {"--text=%text"},
                    offsetLine = 0,
                    offsetColumn = 1,
                    sourceName = "write-good",
                    formatLines = 1,
                    formatPattern = {
                        "(.*)\\s+on\\s+line\\s+(\\d+)\\s+at\\s+column\\s+(\\d+)\\s*$",
                        {
                            line = 2,
                            column = 3,
                            message = 1
                        }
                    }
                }
            },
            filetypes = {
                javascript = 'eslint',
                javascriptreact = 'eslint',
                typescript = 'eslint',
                typescriptreact = 'eslint',
                markdown = {'markdownlint', 'writegood'},
                pandoc = {'markdownlint', 'writegood'},
                sh = 'shellcheck'
            },
            formatters = {
                eslint = {
                    command = 'eslint',
                    args = {
                        '--stdin', '--stdin-filename', '%filename',
                        '--fix-to-stdout'
                    },
                    rootPatterns = {'.git'}
                },
                prettier = {
                    command = 'prettier',
                    args = {'--stdin-filepath', '%filename'}
                }
            },
            formatFiletypes = {
                css = 'prettier',
                javascript = 'eslint',
                javascriptreact = 'eslint',
                scss = 'prettier',
                less = 'prettier',
                typescript = 'eslint',
                typescriptreact = 'eslint',
                json = 'prettier',
                markdown = 'prettier',
                scss = 'stylelint',
                sass = 'stylelint',
                less = 'stylelint',
                css = 'stylelint'
            }
        }
    }

    -- icon
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            -- This sets the spacing and the prefix, obviously.
            virtual_text = {
                spacing = 4,
                prefix = ''
            }
        })

end

return M
