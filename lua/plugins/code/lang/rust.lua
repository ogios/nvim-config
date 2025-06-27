local function postfix_wrap_call(trig, call, requires)
  return {
    postfix = trig,
    body = {
      call .. "(${receiver})",
    },
    requires = requires,
    scope = "expr",
  }
end
local function postfix_wrap_type(trig, call, requires)
  return {
    postfix = trig,
    body = {
      call .. "<${receiver}>",
    },
    requires = requires,
    scope = "type",
  }
end
local snippets = {
  custom = {

    ["Extend::extend"] = postfix_wrap_call("extend", "_.extend"),
    ["Arc::new"] = postfix_wrap_call("arc", "Arc::new", "std::sync::Arc"),
    ["Mutex::new"] = postfix_wrap_call("mutex", "Mutex::new", "std::sync::Mutex"),
    ["RefCell::new"] = postfix_wrap_call("refcell", "RefCell::new", "std::cell::RefCell"),
    ["Cell::new"] = postfix_wrap_call("cell", "Cell::new", "std::cell::Cell"),
    ["Rc::new"] = postfix_wrap_call("rc", "Rc::new", "std::rc::Rc"),
    ["Box::pin"] = postfix_wrap_call("pin", "Box::pin"),
    ["Some"] = postfix_wrap_call("some", "Some", nil),
    ["Ok"] = postfix_wrap_call("ok", "Ok", nil),
    ["Err"] = postfix_wrap_call("err", "Err", nil),
    ["Option"] = postfix_wrap_type("option_type", "Option", nil),
    ["RefCell"] = postfix_wrap_type("refcell_type", "RefCell", nil),
    ["Rc"] = postfix_wrap_type("rc_type", "Rc", nil),
    ["Box"] = postfix_wrap_type("box_type", "Box", nil),
    ["unsafe"] = {
      postfix = "unsafe",
      body = { "unsafe { ${receiver} }" },
      description = "Wrap in unsafe{}",
      scope = "expr",
    },
    ["for"] = {
      postfix = "for",
      body = { [[for ${1:i} in ${receiver} {
              $0
              }]] },
      description = "Wrap in for _ in _ {}",
      scope = "expr",
    },
    ["if"] = {
      postfix = "if",
      body = { [[if ${receiver} {
              $0
              }]] },
      scope = "expr",
      description = "Wrap in if _ {}",
    },
    ["thread::spawn"] = {
      prefix = "spawn",
      body = {
        "thread::spawn(move || {",
        "\t$0",
        "});",
      },
      description = "Spawn a new thread",
      requires = "std::thread",
    },
    ["channel"] = {
      prefix = "channel",
      body = { "let (tx,rx) = mpsc::channel()" },
      description = "(tx,rx) = channel()",
      requires = "std::sync::mpsc",
    },
    ["from"] = {
      postfix = "from",
      body = {
        "${0:From}::from(${receiver})",
      },
      scope = "expr",
    },

    ["println directly"] = {
      postfix = "pl",
      body = 'println!("{}", ${receiver});',
      scope = "expr",
    },
  },
}

return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      -- neoconf
      require("neoconf.plugins").register({
        name = "rust",
        on_schema = function(schema)
          schema:import("rust", { features = {}, no_default_feature = false, cfgs = {} })
          schema:set("rust.features", {
            description = "Specify features to enable, leave empty to enable all",
            type = "string",
          })
          schema:set("rust.no_default_feature", {
            description = "no default feature, default false",
            type = "boolean",
          })
          schema:set("rust.cfgs", {
            description = "Specify cfgs to enable, leave empty to do nothing",
            type = "string",
          })
        end,
      })

      opts.server.on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>ce", function()
          vim.cmd.RustLsp("expandMacro")
        end, { desc = "Expand Macro (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>co", function()
          vim.cmd.RustLsp("openDocs")
        end, { desc = "Open Docs (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>cO", function()
          vim.cmd.RustLsp("openCargo")
        end, { desc = "Open Cargo.toml (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>cp", function()
          vim.cmd.RustLsp("parentModule")
        end, { desc = "Open Parent Module (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<leader>dR", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Debuggables (Rust)", buffer = bufnr })

        vim.keymap.set("n", "K", function()
          vim.cmd.RustLsp({ "hover", "actions" })
        end, { desc = "Hover action (Rust)", buffer = bufnr })

        vim.keymap.set("n", "<C-k>", function()
          vim.cmd.RustLsp({ "hover", "range" })
        end, { desc = "Hover range (Rust)", buffer = bufnr })
      end

      local setup_feature = function()
        local specify_features = require("neoconf").get("rust.features", nil)
        if specify_features == nil then
          return
        end
        if vim.islist(specify_features) == false then
          require("lazyvim.util").warn("rust.features provided in neoconf, but it's not a list, ignored")
          return
        end
        if vim.tbl_count(specify_features) == 0 then
          return
        end

        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        cargo.features = specify_features
        cargo.allFeatures = false
        opts.server.default_settings["rust-analyzer"].cargo = cargo
      end

      local function setup_no_default_target()
        local no_default_feature = require("neoconf").get("rust.no_default_feature", nil)
        if no_default_feature == nil then
          return
        end
        if no_default_feature ~= true then
          return
        end
        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        cargo.noDefaultFeatures = true
        opts.server.default_settings["rust-analyzer"].cargo = cargo
      end

      local setup_cfgs = function()
        local cfgs = require("neoconf").get("rust.cfgs", nil)
        if cfgs == nil then
          return
        end
        if vim.islist(cfgs) == false then
          require("lazyvim.util").warn("rust.cfgs provided in neoconf, but it's not a list, ignored")
          return
        end
        if vim.tbl_count(cfgs) == 0 then
          return
        end

        local cargo = opts.server.default_settings["rust-analyzer"].cargo or {}
        cargo.cfgs = cargo.cfgs or {}
        vim.list_extend(cargo.cfgs, cfgs)
        opts.server.default_settings["rust-analyzer"].cargo = cargo
      end

      opts.server.default_settings["rust-analyzer"].completion = {
        snippets = snippets,
        postfix = { enable = true },
        fullFunctionSignatures = { enable = true },
        termSearch = { enable = true },
      }
      -- local st = opts.server.default_settings["rust-analyzer"]
      -- opts.server.default_settings["rust-analyzer"] = vim.tbl_extend("force", st or {}, {
      --   diagnostics = {
      --     enable = true,
      --     experimental = {
      --       enable = true,
      --     },
      --   },
      --   completion = {
      --     snippets = snippets,
      --     postfix = { enable = true },
      --     fullFunctionSignatures = { enable = true },
      --     termSearch = { enable = true },
      --   },
      --   hover = {
      --     actions = {
      --       enable = true,
      --       references = { enable = true },
      --       run = { enable = true },
      --     },
      --   },
      --   rustfmt = {
      --     rangeFormatting = { enable = true },
      --   },
      --   typing = {
      --     autoClosingAngleBrackets = { enable = true },
      --   },
      -- })

      -- snippet
      -- LazyVim.info(vim.inspect(opts.server.default_settings["rust-analyzer"].completion))
      -- opts.server.default_settings["rust-analyzer"].completion.snippets = {
      --   custom = {
      --     ["println directly"] = {
      --       postfix = "pl",
      --       body = 'println!("{}", ${receiver});',
      --       scope = "expr",
      --     },
      --   },
      -- }
      setup_cfgs()
      setup_no_default_target()
      setup_feature()

      LazyVim.info(vim.inspect(opts.server.default_settings["rust-analyzer"]))
    end,
  },
}
