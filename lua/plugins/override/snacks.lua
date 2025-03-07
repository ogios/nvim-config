return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = true,
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["O"] = "explorer_open", -- open with system application
                  ["o"] = "confirm",
                  ["<ESC>"] = "noop",
                  ["l"] = "noop",
                  ["h"] = "noop",
                },
              },
            },
          },
        },
      },
    },
  },
}
-- neo-tree sow hidden file and use `o` keymap
-- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     opts = {
--       filesystem = {
--         filtered_items = {
--           hide_dotfiles = false,
--           hide_gitignored = false,
--           hide_hidden = false,
--         },
--       },
--       window = {
--         mappings = {
--           ["o"] = { "open", nowait = true },
--           ["oc"] = "noop",
--           ["od"] = "noop",
--           ["og"] = "noop",
--           ["om"] = "noop",
--           ["on"] = "noop",
--           ["os"] = "noop",
--           ["ot"] = "noop",
--         },
--       },
--     },
--
--     cmd = "Neotree",
--     keys = {
--       {
--         "<leader>fe",
--         function()
--           require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
--         end,
--         desc = "Explorer NeoTree (cwd)",
--       },
--       {
--         "<leader>fE",
--         function()
--           require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root() })
--         end,
--         desc = "Explorer NeoTree (root dir)",
--       },
--       { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
--       { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (root dir)", remap = true },
--       {
--         "<leader>ge",
--         function()
--           require("neo-tree.command").execute({ source = "git_status", toggle = true })
--         end,
--         desc = "Git explorer",
--       },
--       {
--         "<leader>be",
--         function()
--           require("neo-tree.command").execute({ source = "buffers", toggle = true })
--         end,
--         desc = "Buffer explorer",
--       },
--     },
--   },
-- }
