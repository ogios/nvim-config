-- UI 插件配置
-- 使用 vim.pack 的插件配置方式

-- 主题配置 (moonfly)
local ok_colorscheme, _ = pcall(vim.cmd, "colorscheme moonfly")
if not ok_colorscheme then
  vim.notify("Colorscheme moonfly not found, using default", vim.log.levels.WARN)
end

-- lualine 配置
local ok_lualine, lualine = pcall(require, "lualine")
if ok_lualine then
  lualine.setup({
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })
end

-- bufferline 配置
local ok_bufferline, bufferline = pcall(require, "bufferline")
if ok_bufferline then
  bufferline.setup({
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  })
end

-- which-key 配置
local ok_whichkey, whichkey = pcall(require, "which-key")
if ok_whichkey then
  whichkey.setup({
    plugins = {
      spelling = { enabled = true },
    },
  })
end

-- mini.indentscope 配置
local ok_indentscope, indentscope = pcall(require, "mini.indentscope")
if ok_indentscope then
  indentscope.setup({
    symbol = "│",
    options = { try_as_border = true },
  })
end

-- mini.icons 配置
local ok_icons, icons = pcall(require, "mini.icons")
if ok_icons then
  icons.setup()
end

-- mini.hipatterns 配置
local ok_hipatterns, hipatterns = pcall(require, "mini.hipatterns")
if ok_hipatterns then
  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end

-- gitsigns 配置
local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if ok_gitsigns then
  gitsigns.setup({
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk" })
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk" })
      map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
      map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { desc = "Blame line" })
      map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, { desc = "Diff this ~" })
      map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
      map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
    end,
  })
end

-- todo-comments 配置
local ok_todo, todo = pcall(require, "todo-comments")
if ok_todo then
  todo.setup({
    highlight = {
      pattern = ".*<(KEYWORDS)\\s*:?",
      before = "",
      keyword = "bg",
      after = "fg",
      comments_only = false,
    },
  })
end

-- git-conflict 配置
local ok_gitconflict, gitconflict = pcall(require, "git-conflict")
if ok_gitconflict then
  gitconflict.setup()
end

-- mini.diff 配置
local ok_mini_diff, mini_diff = pcall(require, "mini.diff")
if ok_mini_diff then
  mini_diff.setup()
end

-- neo-tree 配置
local ok_neotree, neotree = pcall(require, "neo-tree")
if ok_neotree then
  neotree.setup({
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        position = "left",
        width = 30,
      },
    },
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["o"] = "open",
        ["O"] = "open_vsplit",
        ["oc"] = "noop",
        ["od"] = "noop",
        ["og"] = "noop",
        ["om"] = "noop",
        ["on"] = "noop",
        ["os"] = "noop",
        ["ot"] = "noop",
      },
    },
  })

  -- neo-tree 快捷键
  vim.keymap.set("n", "<leader>e", function()
    local neotree = require("neo-tree.command")
    neotree.execute({ action = "focus", dir = vim.loop.cwd() })
  end, { desc = "Open Neo-tree (cwd)", silent = true })

  vim.keymap.set("n", "<leader>E", function()
    local neotree = require("neo-tree.command")
    neotree.execute({ action = "focus" })
  end, { desc = "Open Neo-tree (root)", silent = true })
end

-- mini.move 配置
local ok_mini_move, mini_move = pcall(require, "mini.move")
if ok_mini_move then
  mini_move.setup()
end

-- mini.surround 配置
local ok_mini_surround, mini_surround = pcall(require, "mini.surround")
if ok_mini_surround then
  mini_surround.setup({
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
  })
end

-- mini.pairs 配置
local ok_mini_pairs, mini_pairs = pcall(require, "mini.pairs")
if ok_mini_pairs then
  mini_pairs.setup()
end

-- 搜索替换配置
local ok_searchreplace, searchreplace = pcall(require, "search-replace")
if ok_searchreplace then
  searchreplace.setup({
    default_replace_single_buffer_option = "skipcurrent",
  })
end

-- persistence 配置
local ok_persistence, persistence = pcall(require, "persistence")
if ok_persistence then
  persistence.setup({
    dir = vim.fn.stdpath("state") .. "/sessions/",
    need = 1,
  })
end
