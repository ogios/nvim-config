return {
  "zbirenbaum/copilot.lua",
  enabled = false,
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
    {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
      config = function()
        vim.g.copilot_nes_debounce = 500
      end,
    },
  },
  keys = {
    {
      "<leader><C-a>",
      function()
        if require("copilot.panel").is_open() then
          require("copilot.panel").close()
        else
          require("copilot.panel").open({})
        end
      end,
      mode = { "n" },
      desc = "Copilot panel",
    },

    {
      "<C-a>",
      function()
        require("copilot.panel").accept()
      end,
      mode = { "n", "i" },
      desc = "Copilot panel",
    },

    -- {
    --   "<C-e>",
    --   function()
    --     require("copilot.panel").jump_next()
    --   end,
    --   mode = { "n", "i" },
    --   desc = "Copilot panel",
    -- },
  },
  config = function()
    require("copilot").setup({
      copilot_model = "gpt-41-copilot",
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
        enabled = true,
        auto_refresh = true,
        layout = {
          position = "right",
        },
      },
      nes = {
        enabled = false,
        keymap = {
          accept_and_goto = "<leader>p",
          accept = false,
          dismiss = "<Esc>",
        },
      },
      suggestion = {
        auto_trigger = true,
        debounce = 200,
        keymap = {
          accept = "<C-q>",
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
