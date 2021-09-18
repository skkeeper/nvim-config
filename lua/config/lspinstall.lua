local M = {}

M.config = function()
    local function setup_servers()
      require'lspinstall'.setup()
      local servers = require'lspinstall'.installed_servers()
      for _, server in pairs(servers) do
        require'lspconfig'[server].setup{}
      end
    end

    setup_servers()

    -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
    require'lspinstall'.post_install_hook = function ()
      setup_servers() -- reload installed servers
      vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
    end
end

M.bootstrap = function()
  local required_servers = {
          "lua",
          "vim",
          "diagnosticls",
          "typescript",
          "java",
          "css",
          "html",
          "bash",
          "deno",
          "dockerfile",
          "csharp",
          "cpp",
          "json",
          "kotlin",
          "rust",
          "yaml"
      }
      local installed_servers = require'lspinstall'.installed_servers()
      for _, server in pairs(required_servers) do
        if not vim.tbl_contains(installed_servers, server) then
          require'lspinstall'.install_server(server)
        end
      end
end

return M
