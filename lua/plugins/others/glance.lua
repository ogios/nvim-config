return {
  "dnlhc/glance.nvim",
  lazy = true,
  cmd = {
    "Glance",
  },
  config = function()
    local glance = require("glance")
    -- local actions = glance.actions

    glance.setup({
      height = 36,
      theme = {
        enable = true,
        mode = "darken",
      },
      -- mappings = {
      --   list = {
      --     ["\\"] = actions.jump_vsplit,
      --     ["-"] = actions.jump_split,
      --     ["s"] = "<Plug>(leap-forward-to)",
      --     ["v"] = "v",
      --     ["gp"] = actions.enter_win("preview"),
      --     ["<leader>l"] = "<leader>l",
      --   },
      --   preview = {
      --     ["gp"] = actions.enter_win("list"),
      --     ["<leader>l"] = "<leader>l",
      --   },
      -- },
      folds = {
        folded = false,
      },
    })
  end,
}
