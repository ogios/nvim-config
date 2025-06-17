return {

  {
    "wavded/vim-stylus",
    event = { "BufEnter" },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = function(_, opts)
      opts.multiline_threshold = 6
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        -- origin
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",

        "tsx",
        "typescript",
        "css",
        "vue",
        "java",
        "go",
        "jsonc",
        "scss",

        "hyprlang",
        "kdl",
        "vhs",

        "qmljs",
      })
    end,
  },

  { "saecki/live-rename.nvim", event = "BufEnter" },
  {
    "dnlhc/glance.nvim",
    event = "BufEnter",
    cmd = {
      "Glance",
    },
    config = function()
      local glance = require("glance")
      local actions = glance.actions

      glance.setup({
        height = 36,
        theme = {
          enable = true,
          mode = "darken",
        },
        mappings = {
          list = {
            ["gp"] = actions.enter_win("preview"),
          },
          preview = {
            ["gp"] = actions.enter_win("list"),
            ["Q"] = actions.close,
          },
        },
        folds = {
          folded = false,
        },
        border = {
          enable = true,
        },
        use_trouble_qf = true,
      })
    end,
  },
}
