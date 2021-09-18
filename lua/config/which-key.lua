local M = {}

M.config = function()
    require("which-key").setup {}
    local wk = require("which-key")

    wk.register({
      x = "Buffer: Close",
      o = "Buffer: Close all others",
      k = "Buffer: Previous",
      j = "Buffer: Next",
      g = {
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
      },
      c = {
          name = "quickfix",
          f = "First",
          l = "Last",
          n = "Next",
          p = "Previous",
          c = "Close",
          o = "Open"
      },
      e = "Explore current directory",
      p = {
          s = "Project Search",
          e = "Project Explore",
          b = "Git branches ",
          c = "Git commits 🔭",
          f = "Git buffer commits 🔭",
          h = "Git status 🔭"
      },
      d = {
          s = "Search Nvim config"
      }
    }, { prefix = "<leader>" })

    wk.register({
      ["#"] = "Symbol Outline",
      a = {
          name = "Code",
          c = "Code action",
          C = "Code action 🔭",
          r = "References",
          i = "Implementation",
          t = "Type definitions",
          d = "Definitions",
          s = "Symbols",
          w = "Workspace Symbols",
      },
      b = "Git blame",
      d = "Git diff split",
      l = "Git file log",
      c = {
          name = "Location List",
          f = "First",
          l = "Last",
          n = "Next",
          p = "Previous",
          c = "Close",
          o = "Open"
      },
    }, { prefix = "<localleader>" })

    wk.register({
        name = "Navigation",
        b = "Buffers 🔭",
        c = "Command history 🔭",
        e = "Search file",
        f = "File Browser 🔭",
        p = "Find Files 🔭",
        q = "Find quickfix 🔭",
        t = "Find tags 🔭"
    }, { prefix = "," })

end


return M
