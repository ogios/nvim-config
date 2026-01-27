return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",

    keys = {
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers({
            layout = {
              preview = "main",
              reverse = true,
              layout = {
                backdrop = false,
                row = -1,
                width = 0.4,
                min_width = 80,
                height = 0.2,
                min_height = 0.1,
                border = "bold",
                box = "vertical",
                { win = "preview", title = "{preview}", border = true },
                { win = "list", border = "hpad" },
                { win = "input", height = 1, border = true, title = "{title} {live} {flags}", title_pos = "center" },
              },
            },
          })
        end,
        desc = "buffer",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files({
            show_empty = true,
            hidden = true,
            ignored = true,
            follow = true,
          })
        end,
        desc = "find files",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.files({
            show_empty = true,
            hidden = true,
            ignored = true,
            follow = true,
            layout = {
              preview = "main",
              reverse = true,
              layout = {
                backdrop = false,
                row = -1,
                width = 0.4,
                min_width = 80,
                height = 0.2,
                min_height = 0.1,
                border = "bold",
                box = "vertical",
                { win = "preview", title = "{preview}", border = true },
                { win = "list", border = "hpad" },
                { win = "input", height = 1, border = true, title = "{title} {live} {flags}", title_pos = "center" },
              },
            },
          })
        end,
        desc = "find files quick",
      },
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
      picker = {
        layout = {
          -- telescope split
          reverse = true,
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              { win = "list", title = " Results ", title_pos = "center", border = true },
              { win = "input", height = 1, border = true, title = "{title} {live} {flags}", title_pos = "center" },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              width = 0.45,
              border = true,
              title_pos = "center",
            },
          },

          -- ivy split
          -- preview = "main",
          -- reverse = true,
          -- layout = {
          --   box = "vertical",
          --   backdrop = false,
          --   width = 0,
          --   height = 0.4,
          --   position = "bottom",
          --   border = "top",
          --   title = " {title} {live} {flags}",
          --   title_pos = "left",
          --   {
          --     box = "horizontal",
          --     { win = "list", border = "none" },
          --     { win = "preview", title = "{preview}", width = 0.6, border = "left" },
          --   },
          --   { win = "input", height = 1, border = "bottom" },
          -- },
        },
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
