return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "BufRead",
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
        enabled = false,
        -- auto_refresh = true,
        -- layout = {
        --   position = "right",
        -- },
      },
      suggestion = {
        auto_trigger = true,
        debounce = 200,
        keymap = {
          accept = "<M-q>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = false,
        },
      },
    })
  end,
}
