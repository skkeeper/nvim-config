require("config/settings")
require("config/netrw")
require("config/plugins")
require("config/keybindings")

vim.cmd("runtime! plugins/**.vim")
