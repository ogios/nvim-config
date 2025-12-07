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
