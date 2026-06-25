-- LSP 配置

-- 基础 LSP 设置
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- LSP 签名配置
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Mason 配置
local ok_mason, mason = pcall(require, "mason")
if ok_mason then
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

-- Mason-lspconfig 配置
local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
  mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "pyright",
      "ruff",
      "jsonls",
      "bashls",
      "yamlls",
    },
  })
end

-- Mason-nvim-dap 配置
local ok_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
if ok_mason_dap then
  mason_dap.setup({
    automatic_installation = true,
    handlers = {},
    ensure_installed = {},
  })
end

-- nvim-lspconfig 配置
local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if ok_lspconfig then
  -- 通用 LSP on_attach
  local on_attach = function(client, bufnr)
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end

  -- 通用 LSP 能力
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok_cmp, cmp_lsp = pcall(require, "blink.cmp")
  if ok_cmp then
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
  end

  -- LSP 服务器配置
  local servers = {
    "lua_ls",
    "rust_analyzer",
    "pyright",
    "ruff",
    "jsonls",
    "bashls",
    "yamlls",
  }

  for _, server in ipairs(servers) do
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- 特殊服务器配置
    if server == "lua_ls" then
      opts.settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      }
    elseif server == "jsonls" then
      opts.settings = {
        json = {
          validate = { enable = true },
          allowComments = true,
        },
      }
    elseif server == "ruff" then
      opts.settings = {
        organizeImports = true,
        fixAll = true,
      }
    end

    lspconfig[server].setup(opts)
  end
end

-- nvim-dap 配置
local ok_dap, dap = pcall(require, "dap")
if ok_dap then
  -- DAP UI 配置
  local ok_dapui, dapui = pcall(require, "dapui")
  if ok_dapui then
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25,
          position = "bottom",
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
      },
    })

    -- 自动打开/关闭 DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end

  -- DAP 虚拟文本配置
  local ok_dvt, dvt = pcall(require, "nvim-dap-virtual-text")
  if ok_dvt then
    dvt.setup()
  end
end

-- neotest 配置
local ok_neotest, neotest = pcall(require, "neotest")
if ok_neotest then
  neotest.setup({
    adapters = {},
  })
end

-- 颜色高亮 (hover)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.colorProvider then
      client.textDocument_colorPresentation = function()
        -- 颜色表示
      end
    end
  end,
})

-- lazydev 配置 (Lua 开发支持)
local ok_lazydev, lazydev = pcall(require, "lazydev")
if ok_lazydev then
  lazydev.setup()
end

-- rustaceanvim 配置
vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      replace_builtin_hover = true,
    },
  },
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<leader>cR", function()
        vim.cmd.RustLsp("codeAction")
      end, { desc = "Code Action", buffer = bufnr })

      vim.keymap.set("n", "<leader>dr", function()
        vim.cmd.RustLsp("debuggables")
      end, { desc = "Rust Debuggables", buffer = bufnr })
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        checkOnSave = true,
        diagnostics = {
          enable = true,
        },
        procMacro = {
          enable = true,
        },
        files = {
          exclude = {
            ".direnv", ".git", ".jj", ".github", ".gitlab",
            "bin", "node_modules", "target", "venv", ".venv",
          },
          watcher = "client",
        },
      },
    },
  },
}
