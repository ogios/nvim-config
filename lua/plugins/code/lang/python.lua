vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "/workspaces/moveit_control/src/elfin_robot_ros2/**/*.py",
    vim.fn.expand("~") .. "/work/huimao/paint-robot/moveit_control/src/elfin_robot_ros2/**/*.py",
  },
  callback = function()
    vim.b.autoformat = false
    -- vim.b.autoformat = false
    -- require("lazyvim.plugins.lsp.format").autoformat = false
  end,
})

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
          -- cmd = {
          --   vim.fn.expand("~") .. "/work/pyrefly/target/release/pyrefly",
          --   "lsp",
          --   -- get all path in PYTHONPATH env var
          --   -- "--site-package-path",
          --   -- vim.env.PYTHONPATH,
          --   -- "-v"
          -- },
          -- mason = false,
          -- init_options for the pyrefly language server. Converted from JSON-like
          -- structure to a proper Lua table so this file can be loaded by Neovim.
          init_options = {
            pyrefly = {
              disabledLanguageServices = {
                hover = false,
                documentSymbol = false,
                workspaceSymbol = false,
                inlayHint = false,
                completion = false,
                codeAction = false,
                definition = false,
                declaration = false,
                typeDefinition = false,
                references = false,
                documentHighlight = false,
                rename = false,
                codeLens = false,
                semanticTokens = false,
                signatureHelp = false,
                implementation = false,
                callHierarchy = false,
              },
            },
          },
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
        -- pyrefly = function()
        --   -- disable pyrefly
        --   return true
        -- end,
        ty = function()
          -- disable ty
          return true
        end,
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
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
      config = function()
        require("dap-python").setup("debugpy-adapter")
      end,
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
