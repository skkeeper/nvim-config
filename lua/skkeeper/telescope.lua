local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local entry_display = require "telescope.pickers.entry_display"
local conf = require("telescope.config").values
local tableUtils = require("skkeeper/utils/table")

local M = {}

local send_to_quickfix = function(results)
    local parsed = {}
    for k, v in pairs(results) do
        if v ~= '' then table.insert(parsed, {filename = v}) end
    end
    vim.fn.setqflist(parsed)
    vim.api.nvim_command('copen');
end

local get_files_previous_commit = function()
    return vim.fn.systemlist('git log --pretty=format: --name-only -n 1')
end

local get_files_since_fork = function(branch)
    local pattern = "^commit: ";
    local output = tableUtils.removeDuplicates(
                       vim.fn.systemlist('git log ' .. branch ..
                                             '.. --pretty=format:"commit: %h %ar" --name-only'))
    local results = {}

    local commit = '';
    for k, v in pairs(output) do
        if v:find(pattern) ~= nil then
            commit = v
        else
            table.insert(results,
                         {filename = v, commit = commit:gsub(pattern, "")})
        end
    end
    return results
end

M.last_commit_telescope = function()
    local results = get_files_previous_commit()
    pickers.new(opts, {
        prompt_title = "Last Commit",
        finder = finders.new_table {results = results},
        sorter = conf.generic_sorter(opts),
        previewer = conf.file_previewer({})
    }):find()
end

M.fork_to_telescope = function(branch)
    branch = branch or "develop"
    local results = get_files_since_fork(branch)

    local displayer = entry_display.create {
        separator = " ",
        items = {{}, {width = 100}}
    }

    local make_display = function(entry)
        return displayer {
            {entry.filename}, {entry.commit, "Variable"}
        }
    end

    pickers.new(opts, {
        prompt_title = "Changes since fork",
        finder = finders.new_table {
            results = results,
            entry_maker = function(entry)
                return {
                    value = entry.filename,
                    display = make_display(entry),
                    ordinal = entry.filename
                }
            end
        },
        sorter = conf.generic_sorter(opts),
        previewer = conf.file_previewer({})
    }):find()
end

M.last_commit_to_quickfix = function()
    local results = get_files_previous_commit()
    send_to_quickfix(results)
end

M.fork_to_quickfix = function(branch)
    branch = branch or "develop"
    local results = get_files_since_fork(branch)
    send_to_quickfix(tableUtils.map(results,
                                    function(item) return item.filename end))
end

M.eslint_rules_to_telescope = function()
    local targetFile = vim.fn.expand("%")
    if targetFile == '' then
        print("No file opened.")
        return
    end
    local results = vim.fn.system("eslint --print-config " .. targetFile)
    local parsed = vim.fn.json_decode(results)
    local rules = {}
    for k, v in pairs(parsed.rules) do table.insert(rules, k) end

    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    local opts = require("telescope.themes").get_dropdown {}
    pickers.new(opts, {
        prompt_title = "eslint rules",
        finder = finders.new_table {results = rules},
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({
                    "// eslint-disable-next-line " .. selection[1]
                }, "l", false, true)
            end)
            return true
        end
    }):find()
end

vim.cmd([[
    command! LastCommitToQuickfix lua require("skkeeper/telescope").last_commit_to_quickfix()
    command! -nargs=? ForkToQuickfix call luaeval("require('skkeeper/telescope').fork_to_quickfix(_A)", <f-args>)
]])

vim.cmd([[
    command! LastCommitToTelescope lua require("skkeeper/telescope").last_commit_telescope()
    command! -nargs=? ForkToTelescope call luaeval("require('skkeeper/telescope').fork_to_telescope(_A)", <f-args>)
]])

vim.cmd([[
    command! EslintRulesDisableNextLine lua require("skkeeper/telescope").eslint_rules_to_telescope() 
]])

vim.cmd([[
    command! GitConflicts cex(system("git diff --check"))
]])

return M
