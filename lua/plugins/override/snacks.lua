return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    keys = {
      -- {
      --   "<leader>e",
      --   function()
      --     Snacks.explorer({ cwd = vim.loop.cwd(), hidden = true })
      --   end,
      --   desc = "Open current directory",
      -- },
    },
    ---@type snacks.Config
    opts = {
      lazygit = {
        config = {
          os = {
            edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
            editAtLine = '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" &&  nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>")',
            openDirInEditor = '[ -z "$NVIM" ] && (nvim -- {{dir}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{dir}})',
          },
        },
      },
      dashboard = {
        enabled = false,
      },
      image = {
        enabled = true,
        doc = {
          enabled = true,
          inline = false,
          float = true,
          max_width = 40,
          max_height = 30,
        },
      },
      explorer = {
        replace_netrw = true,
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      -- picker = {
      --   cwd = vim.loop.cwd(),
      --   hidden = true,
      --   sources = {
      --     explorer = {
      --       win = {
      --         list = {
      --           keys = {
      --             ["O"] = "explorer_open", -- open with system application
      --             ["o"] = "confirm",
      --             ["<ESC>"] = "noop",
      --             ["l"] = "noop",
      --             ["h"] = "noop",
      --           },
      --         },
      --       },
      --     },
      --   },
      -- },
    },
  },
}
