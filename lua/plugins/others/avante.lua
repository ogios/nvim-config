return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- enabled = false,
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "copilot",
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      cancel = {
        normal = { "<C-c>", "<Esc>", "q" },
        insert = { "<C-c>" },
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        retry_user_request = "r",
        edit_user_request = "e",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
        remove_file = "d",
        add_file = "@",
        close = { "<Esc>", "q" },
        close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-mini/mini.icons",
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      dependencies = {
        {
          "nvim-lualine/lualine.nvim",
          dependencies = {
            { "AndreM222/copilot-lualine" },
          },
          opts = function(_, opts)
            table.insert(opts.sections.lualine_x, 2, "copilot")
          end,
        },
      },
      keys = {
        -- run `:Copilot panel` when press <M-w> under `n` or `i` mode
        {
          "<M-w>",
          function()
            require("copilot.panel").toggle()
          end,
          mode = { "n", "i" },
          desc = "Copilot panel",
        },
      },
      -- event = "InsertEnter",
      config = function()
        require("copilot").setup({
          copilot_model = "gpt-4o-copilot",
          filetypes = {
            markdown = true,
            -- gitcommit = true,
            -- gitrebase = true,
            -- diff = true,
            -- help = true,
            -- text = true,
            -- plaintext = true,
          },
          panel = {
            -- auto_refresh = true,
            layout = {
              position = "right",
            },
          },
          suggestion = {
            auto_trigger = true,
            debounce = 200,
            keymap = {
              accept = "<M-Tab>",
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = false,
            },
          },
        })
      end,
    },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
