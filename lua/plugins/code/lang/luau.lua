return {
  {
    "lopi-py/luau-lsp.nvim",
    opts = {
      types = {
        definition_files = {
          noctalia = "noctalia.d.luau",
        },
      },
      platform = {
        type = "standard",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        luau_lsp = {},
      },
      setup = {
        luau_lsp = function()
          -- disable launching through lazyvim
          return true
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "luau",
      },
    },
  },
}
