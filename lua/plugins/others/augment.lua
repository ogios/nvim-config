return {
  {
    "augmentcode/augment.vim",
    enabled = false,
    event = "VeryLazy",
    keys = {
      { "<M-Tab>", "<cmd>call augment#Accept()<cr>", mode = "i", desc = "Accept augment completion" },
    },
    config = function()
      require("neoconf.plugins").register({
        name = "augment",
        on_schema = function(schema)
          schema:import("augment", { workspaces = {} })
          schema:set("rust.workspaces", {
            description = "augment workspaces",
            type = "array",
          })
        end,
      })

      local workspaces = require("neoconf").get("augment.workspaces", {})
      vim.list_extend(workspaces, { LazyVim.root() })
      vim.g.augment_workspace_folders = workspaces

      vim.g.augment_disable_tab_mapping = true
    end,
  },
}
