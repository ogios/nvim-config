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

-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "Execute hook after switching to a buffer",
--   callback = function()
--     if vim.bo.filetype == "python" then
--       vim.defer_fn(function()
--         vim.api.nvim_feedkeys("ii", "n", false)
--         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
--         -- vim.cmd("set readonly")
--
--         -- -- 2. 动态注册一个单次执行的 Autocmd，等待诊断回复
--         -- vim.api.nvim_create_autocmd("LspNotify", {
--         --   pattern = "textDocument/publishDiagnostics",
--         --   once = true, -- 执行一次后自动销毁
--         --   callback = function(args)
--         --     -- -- 确保这个回复是当前文件的诊断回复
--         --     -- if args.data.method == "textDocument/publishDiagnostics" and args.data.bufnr == bufnr then
--         --     --   vim.schedule(function()
--         --     --     vim.api.nvim_feedkeys("u", "n", false)
--         --     --   end)
--         --     --   return true -- 解除绑定
--         --     -- end
--         --   end,
--         -- })
--
--         vim.defer_fn(function()
--           vim.api.nvim_feedkeys("u", "n", false)
--         end, 100)
--       end, 100)
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "Force LSP reload by sending dummy didChange notification",
--   callback = function()
--     if vim.bo.filetype == "python" then
--       vim.defer_fn(function()
--         -- 获取当前 buffer 附加的所有 LSP 客户端
--         local clients = vim.lsp.get_clients({ bufnr = 0 })
--
--         for _, client in ipairs(clients) do
--           -- 获取当前文件的标准参数（包含 URI、版本号等）
--           local params = vim.lsp.util.make_text_document_params()
--
--           -- 获取当前文件的所有文本行
--           local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--
--           -- 核心：直接向 LSP 服务器发送内容更新通知
--           -- text 传递当前文件的完整内容，强制让 LSP 重新解析一遍
--           client.notify("textDocument/didChange", {
--             textDocument = {
--               uri = params.uri,
--               version = (client.text_document_did_change_version or 0) + 1,
--             },
--             contentChanges = {
--               { text = table.concat(lines, "\n") },
--             },
--           })
--
--           -- 更新客户端内部的版本计数（防止版本号冲突）
--           client.text_document_did_change_version = (client.text_document_did_change_version or 0) + 1
--         end
--       end, 1000)
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "Directly notify LSP to reload the buffer",
--   callback = function()
--     if vim.bo.filetype == "python" then
--       vim.schedule(function()
--         -- 遍历当前 Buffer 附加的所有 LSP 客户端
--         local clients = vim.lsp.get_clients({ bufnr = 0 })
--         for _, client in ipairs(clients) do
--           -- 强行触发一次完整的文件同步通知
--           if client.rpc and client.rpc.notify then
--             local params = vim.lsp.util.make_text_document_params()
--             -- 让 LSP 认为该文件刚刚被打开/刷新了
--             client.rpc.notify("textDocument/didOpen", {
--               textDocument = {
--                 uri = params.uri,
--                 languageId = "python",
--                 version = 1,
--                 text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n"),
--               },
--             })
--           end
--         end
--       end)
--     end
--   end,
-- })

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
          -- cmd = {
          --   vim.fn.expand("~") .. "/work/pyrefly/target/release/pyrefly",
          --   "lsp",
          --   -- get all path in PYTHONPATH env var
          --   -- "--site-package-path",
          --   -- vim.env.PYTHONPATH,
          --   -- "-v"
          -- },
          -- mason = false,
        },

        ty = {
          -- cmd = {
          --   -- "/home/ogios/work/ruff/target/debug/ty",
          --   "/workspaces/moveit_control/ty",
          --   "server",
          --   -- get all path in PYTHONPATH env var
          --   -- "--site-package-path",
          --   -- vim.env.PYTHONPATH,
          --   -- "-v"
          -- },
          -- mason = false,
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
