local M = {}

M.config = function()
    local lsp_installer_servers = require'nvim-lsp-installer.servers'

    local required_servers = {
        "sumneko_lua",
        "vimls",
        "diagnosticls",
        "tsserver",
        "eslint",
        "jdtls",
        "cssls",
        "html",
        "bashls",
        "denols",
        "dockerls",
        "omnisharp",
        "clangd",
        "jsonls",
        "kotlin_language_server",
        "rust_analyzer",
        "yamlls"
    }

    for _, server in pairs(required_servers) do
        local server_available, requested_server = lsp_installer_servers.get_server(server)
        if server_available then
            if not requested_server:is_installed() then
                -- Queue the server to be installed
                requested_server:install()
            end
        end
    end
end

return M
