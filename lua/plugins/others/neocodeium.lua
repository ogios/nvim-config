-- add this to the file where you setup your other plugins:
return {
  "ogios/neocodeium",
  event = "VeryLazy",
  keys = {
    {
      "<tab>",
      function()
        require("neocodeium").accept()
      end,
      mode = "i",
      desc = "Accept",
    },
    -- accept word
    {
      "<M-q>",
      function()
        require("neocodeium").accept_word()
      end,
      mode = "i",
      desc = "Accept word",
    },
    -- use previous suggestion
    {
      "<M-a>",
      function()
        require("neocodeium").cycle(-1)
      end,
      mode = "i",
      desc = "previous suggestion",
    },
    -- use next suggestion
    {
      "<M-s>",
      function()
        require("neocodeium").cycle(1)
      end,
      mode = "i",
      desc = "next suggestion",
    },
  },

  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
  end,
}
