return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --- @type lspconfig.options.jsonls
        jsonls = {
          settings = {
            json = {
              schemas = {
                { fileMatch = { "*.json", "*.jsonc" }, schema = { allowTrailingCommas = true } },
              },
            },
          },
        },
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.json" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "json",
        "jsonc",
      },
    },
  },
}
