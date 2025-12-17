return {
  -- { import = "lazyvim.plugins.extras.formatting.black" },

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
          -- cmd = { "pyrefly", "lsp", "-v" },
          cmd = {
            vim.fn.expand("~") .. "/work/pyrefly/target/release/pyrefly",
            "lsp",
            -- "-v"
          },
          mason = false,
        },

        ty = {
          cmd = {
            vim.fn.expand("~") .. "/.local/bin/ty",
            "server",
          },
          mason = false,
        },

        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
              lint = {
                -- enable = false,
              },
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>ci",
              LazyVim.lsp.action["source.fixAll"],
              desc = "Fix all auto-fixable issues",
            },
          },
        },
      },
      setup = {
        pyrefly = function()
          -- disable pyrefly
          return true
        end,
        -- ty = function()
        --   -- disable ty
        --   return true
        -- end,
        ruff = function()
          Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end)
        end,
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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
