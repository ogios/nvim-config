return {
  -- dart
  {
    "akinsho/flutter-tools.nvim",
    enabled = false,
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },

  -- go
  {
    "olexsmir/gopher.nvim",
    event = { "BufEnter *.go" },
    ft = { "go", "gomod" },
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
  },

  -- proto
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        protols = {},
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
        },
      },
    },
  },

  -- hyprland
  { import = "plugins.code.lang.hypr" },

  -- rust
  { import = "plugins.code.lang.rust" },

  -- python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --- @type lspconfig.options.basedpyright
        -- basedpyright = {
        --   settings = {
        --     basedpyright = {
        --       analysis = {
        --         typeCheckingMode = "standard",
        --       },
        --     },
        --   },
        -- },
        --- @type lspconfig.options.pyrefly
        pyrefly = {
          mason = false,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },

  -- json
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

  -- qml
  { import = "plugins.code.lang.qml" },
}
