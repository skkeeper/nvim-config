local M = {}

M.config = function()
   local status, wk = pcall(require, "whichkey_setup")
   if not (status) then
      return
   end

   local which_key_map = {}
   which_key_map.x = "Buffer: Close"
   which_key_map.o = "Buffer: Close all others"
   which_key_map.k = "Buffer: Previous"
   which_key_map.j = "Buffer: Next"

   which_key_map.g = {
      name = "Git",
      s = "Status",
      d = "Diff List",
      j = "Use Left Diff",
      f = "Use Right Diff",
      h = "Push",
      p = "Pull",
      c = "Commit",
      r = "Remove",
      l = "Log",
      b = "Branches",
      t = "Tags"
   }

   which_key_map.c = {
      name = "quickfix",
      f = "First",
      l = "Last",
      n = "Next",
      p = "Previous"
   }

   which_key_map.e = "Explore current directory"

   which_key_map.p = {
      name = "which_key_ignore",
      s = "Project Search",
      e = "Project Explore",
      b = "Git branches (telescope)",
      c = "Git commits (telescope)",
      f = "Buffer Git commits (telescope)",
      h = "Git status (telescope)"
   }

   which_key_map.d = {
      name = "which_key_ignore",
      s = "Search Dot Files"
   }

   wk.register_keymap("leader", which_key_map)

   local which_localkey_map = {}
   which_localkey_map.f = "Format"
   which_localkey_map.s = "Sneak"
   which_localkey_map.S = "Sneak backwards"
   which_localkey_map["#"] = "Symbols"
   which_localkey_map.ac = "Code action"
   which_localkey_map.aC = "Code action (telescope)"
   which_localkey_map.ar = "References"
   which_localkey_map.ai = "Implementation"
   which_localkey_map.at = "Type definitions"
   which_localkey_map.ad = "Definitions"
   which_localkey_map.as = "Symbols"
   which_localkey_map.aw = "Workspace Symbols"
   which_localkey_map.b = "Git blame"
   which_localkey_map.d = "Git diff split"
   which_localkey_map.c = {
      name = "Location List",
      c = "Close",
      f = "First",
      l = "Last",
      n = "Next",
      p = "Previous",
      o = "Open"
   }
   wk.register_keymap("localleader", which_localkey_map)
end

return M
