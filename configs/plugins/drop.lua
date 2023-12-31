return {
  "folke/drop.nvim",
  -- enabled = false,
  event = "VeryLazy",
  config = function()
    math.randomseed(os.time())
    -- local theme = ({ "stars", "snow" })[math.random(1, 3)]
    require("drop").setup { theme = "leaves", screensaver = 1000 * 60 }
  end,
}
