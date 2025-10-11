return {
  "petertriho/nvim-scrollbar",
  event = { "VeryLazy" },
  dependencies = {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  config = true,
}
