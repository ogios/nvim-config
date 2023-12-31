local Mappings = {}
Mappings.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>F"] = { "<cmd> Telescope find_files hidden=true <CR>", "find hidden files" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },

    -- command
    ["<leader>md"] = {
      function()
        require("telescope.builtin").commands()
      end,
      "telescope builtin command",
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "telescope builtin code_action",
    },
  },
}

Mappings.newlsp = {

  n = {
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Float diagnostic",
    },
    ["<leader>lD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["<leader>ld"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    ["<leader>li"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },
    ["<leader>lr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },
    ["<leader>lra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<A-CR>"] = {
      "<CMD>CodeActionMenu<CR>",
      "LSP rename",
    },
  },
}

Mappings.abc = {
  n = {
    ["qw"] = { "viw", "select word in visual mode" },
    ["<leader>ms"] = { "<CMD>SymbolsOutline<CR>", "open up code structure map" },
    ["<C-S-Up>"] = { "<CMD>resize +5<CR>", "increase window height" },
    ["<C-S-Down>"] = { "<CMD>resize -5<CR>", "increase window height" },
    ["<C-S-Left>"] = { "<CMD>vertical resize -5<CR>", "increase window height" },
    ["<C-S-Right>"] = { "<CMD>vertical resize +5<CR>", "increase window height" },
  },
}

Mappings.tabop = {
  i = {
    ["<A-=>"] = {"<CMD>tabnew<CR>", "create new tab"},
    ["<A-->"] = {"<CMD>tabclose<CR>", "close current tab"},
    ["<A-Left>"] = {"<CMD>tabpre<CR>", "tab left(previous)"},
    ["<A-Right>"] = {"<CMD>tabnext<CR>", "tab right(next)"},
  },
  v = {
    ["<A-=>"] = {"<CMD>tabnew<CR>", "create new tab"},
    ["<A-->"] = {"<CMD>tabclose<CR>", "close current tab"},
    ["<A-Left>"] = {"<CMD>tabpre<CR>", "tab left(previous)"},
    ["<A-Right>"] = {"<CMD>tabnext<CR>", "tab right(next)"},
  },
  n = {
    ["<A-=>"] = {"<CMD>tabnew<CR>", "create new tab"},
    ["<A-->"] = {"<CMD>tabclose<CR>", "close current tab"},
    ["<A-Left>"] = {"<CMD>tabpre<CR>", "tab left(previous)"},
    ["<A-Right>"] = {"<CMD>tabnext<CR>", "tab right(next)"},
  }
}


return Mappings
