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
        enabled = true,
        preset = {
          ---@type snacks.dashboard.Item[]|fun(items:snacks.dashboard.Item[]):snacks.dashboard.Item[]?
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⢤⠶⠶⠶⢦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⡤⠴⠶⢤⣄⡀⠀⠀⠀⢀⣤⠶⠛⠋⣁⣀⣤⣤⣤⣤⣤⣤⣤⣀⣈⠉⠛⠳⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣠⠞⢁⣠⣤⣤⣤⣀⠙⠲⣤⠖⠋⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡈⠓⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢰⠃⢠⣿⣿⣿⣿⣿⣿⣷⡦⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⡏⠀⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀
⡇⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢱⣶⡎⢿⣿⣿⣿⣿⢣⣾⣆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣆⠈⢦⡀⠀⠀⠀⠀⠀⠀
⣷⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⡇⢸⣿⣿⣿⡏⢸⣿⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠈⢧⠀⠀⠀⠀⠀⠀
⢹⡆⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠉⠀⢸⣿⣿⣿⡇⠀⠉⠁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠘⡇⠀⠀⠀⠀⠀
⠀⢿⡄⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢸⣿⣿⣿⣇⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠹⣆⠀⠀⠀⠀
⠀⠀⠙⣆⠈⢋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⣾⣿⣿⣿⣿⡀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠈⢦⠀⠀⠀
⠀⠀⠀⢸⡇⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣾⡟⠉⠉⠉⠙⣷⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⢧⡀⠀
⠀⠀⠀⠘⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠰⣿⡷⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠸⡇⠀
⠀⠀⠀⠀⣧⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣿⠀
⠀⠀⠀⠀⢻⡆⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢠⡿⠀
⠀⠀⠀⠀⠈⣿⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣿⣿⠿⠋⢀⡞⠁⠀
⠀⠀⠀⠀⠀⣸⠇⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠗⠀⠀⢤⣤⠶⠋⠀⠀⠀
⠀⠀⢀⡴⠋⠀⣴⣾⣦⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣰⣷⣦⣄⠉⠳⣄⠀⠀⠀
⠀⡴⠋⠀⠐⠋⢹⣿⣿⣿⣦⡙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣾⣿⣿⡏⠉⠓⠄⠈⢧⡀⠀
⣼⠁⣰⡇⠀⣀⣼⣿⣿⣿⣿⣿⣦⣌⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣉⣴⣿⣿⣿⣿⣿⣷⣄⡀⢀⣆⠀⢧⠀
⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣍⡙⠛⠛⠿⠿⣿⡿⠿⠟⠛⠛⣉⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⢸⡆
⠻⣄⠈⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠓⠀⣠⣤⣄⠀⠐⠚⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⢀⡼⠁
⠀⠈⠛⠶⣤⣤⣀⣀⣉⣉⣉⣉⣉⣀⣀⣀⣠⣤⣤⠴⠖⠋⠁⠀⠈⠙⠲⠶⣤⣤⣄⣀⣀⣀⣉⣉⣉⣉⣉⣁⣀⣤⣤⠴⠞⠋⠀⠀
]],
        },
        formats = {
          terminal = { align = "center" },
          version = { "%s", align = "center" },
        },
        sections = {
          {
            section = "terminal",
            -- cmd = 'chafa -p off -f symbols --symbols=sextant --speed=0.9 --scale max "$HOME/Pictures/temp/b07a5b32cc3b7db39f9a2fadec2ae004.gif"',
            cmd = [[export DIR=$HOME/Pictures/temp && chafa -p on -O 9 -f symbols --symbols=sextant --speed=0.9 --scale max "$DIR/$(cd $DIR && shuf -n1 -e *)" --clear]],
            indent = 10,
            ttl = 0,
            enabled = true,
            height = 20,
            padding = 1,
          },
          { section = "startup" },
        },
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
