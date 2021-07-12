local protocol = require'vim.lsp.protocol'

local M = {}

M.config = function()
    local nvim_lsp = require('lspconfig')
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        -- Mappings.
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            -- formatting
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
            vim.api.nvim_command [[augroup END]]
        end

        require'completion'.on_attach(client, bufnr)

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
            '', -- TypeParameter
        }
    end
    -- TypeScript
    nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
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
                vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
            end,
        },
    } 

    nvim_lsp.diagnosticls.setup {
        on_attach = on_attach,
        filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
        init_options = {
            linters = {
                eslint = {
                    command = 'eslint_d',
                    rootPatterns = { '.git' },
                    debounce = 100,
                    args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
                    sourceName = 'eslint_d',
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
            },
            filetypes = {
                javascript = 'eslint',
                javascriptreact = 'eslint',
                typescript = 'eslint',
                typescriptreact = 'eslint',
            },
            formatters = {
                eslint_d = {
                    command = 'eslint_d',
                    args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
                    rootPatterns = { '.git' },
                },
                prettier = {
                    command = 'prettier',
                    args = { '--stdin-filepath', '%filename' }
                }
            },
            formatFiletypes = {
                css = 'prettier',
                javascript = 'eslint_d',
                javascriptreact = 'eslint_d',
                json = 'prettier',
                scss = 'prettier',
                less = 'prettier',
                typescript = 'eslint_d',
                typescriptreact = 'eslint_d',
                json = 'prettier',
                markdown = 'prettier',
            }
        }
    }       

    -- icon
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {
            spacing = 4,
            prefix = ''
        }
    })


end

return M


