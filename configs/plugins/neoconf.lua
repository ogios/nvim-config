return {
  "folke/neoconf.nvim",
  lazy = false,
  config = function()
    require("neoconf").setup {}
  end,
  priority = 1000,
}
