require("config/plugins")
require("config/netrw")
require("config/settings")
require("config/keybindings")

vim.cmd("runtime! plugins/**.vim")
