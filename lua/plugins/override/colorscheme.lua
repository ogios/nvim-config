return {
  -- {
  --   "rebelot/kanagawa.nvim",
  -- },
  -- { "savq/melange-nvim" },
  { "bluz71/vim-moonfly-colors", name = "moonfly" },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  -- },
  -- {
  --   "maxmx03/fluoromachine.nvim",
  --   -- config = function()
  --   --   local fm = require("fluoromachine")
  --   --
  --   --   fm.setup({
  --   --     glow = true,
  --   --     theme = "fluoromachine",
  --   --     transparent = false,
  --   --   })
  --   --
  --   --   vim.cmd.colorscheme("fluoromachine")
  --   -- end,
  -- },
  -- {
  --   "mvllow/modes.nvim",
  --   opts = {
  --     colors = {
  --       bg = "", -- Optional bg param, defaults to Normal hl group
  --       copy = "#f5c359",
  --       delete = "#c75c6a",
  --       insert = "#78ce81",
  --       visual = "#9745be",
  --     },
  --
  --     -- Set opacity for cursorline and number background
  --     line_opacity = 0.15,
  --
  --     -- Enable cursor highlights
  --     set_cursor = true,
  --
  --     -- Enable cursorline initially, and disable cursorline for inactive windows
  --     -- or ignored filetypes
  --     set_cursorline = true,
  --
  --     -- Enable line number highlights to match cursorline
  --     set_number = true,
  --
  --     -- Disable modes highlights in specified filetypes
  --     -- Please PR commonly ignored filetypes
  --     ignore_filetypes = { "NvimTree", "TelescopePrompt" },
  --   },
  --   config = true,
  -- },
  {
    "rasulomaroff/reactive.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },
}
