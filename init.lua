require("config/plugins")
require("config/netrw")
require("config/settings")
require("config/keybindings")
require("skkeeper")

vim.cmd("runtime! plugins/**.vim")
