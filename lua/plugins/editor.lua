-- 编辑器功能插件配置

-- vim-matchup 配置
local ok_matchup, matchup = pcall(require, "vim-matchup")
if ok_matchup then
  vim.g.matchup_matchparen_offscreen = { method = "popup" }
end

-- hlargs 配置
local ok_hlargs, hlargs = pcall(require, "hlargs")
if ok_hlargs then
  hlargs.setup({
    color = "#ef9062",
    excluded_filetypes = {},
    disable = function(buf, win)
      return vim.fn.reg_recording() ~= "" or vim.fn.reg_executing() ~= ""
    end,
  })
end

-- nvim-ts-autotag 配置
local ok_autotag, autotag = pcall(require, "nvim-ts-autotag")
if ok_autotag then
  autotag.setup()
end

-- treesitter-context 配置
local ok_ctx, ctx = pcall(require, "treesitter-context")
if ok_ctx then
  ctx.setup({
    multiline_threshold = 6,
  })
end

-- glance 配置
local ok_glance, glance = pcall(require, "glance")
if ok_glance then
  local actions = glance.actions
  glance.setup({
    height = 36,
    theme = {
      enable = true,
      mode = "darken",
    },
    mappings = {
      list = {
        ["gp"] = actions.enter_win("preview"),
      },
      preview = {
        ["gp"] = actions.enter_win("list"),
        ["Q"] = actions.close,
      },
    },
    folds = {
      folded = false,
    },
    border = {
      enable = true,
    },
    use_trouble_qf = true,
  })
end

-- code_runner 配置
local ok_runner, runner = pcall(require, "code_runner")
if ok_runner then
  runner.setup({
    filetype = {
      python = "python3 -u",
      rust = "cargo run",
      lua = "lua",
    },
  })

  vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { desc = "Run Code", silent = true })
  vim.keymap.set("n", "<leader>rc", ":RunCode<CR>", { desc = "Run Code (config)", silent = true })
end

-- csvview 配置
local ok_csv, csv = pcall(require, "csvview")
if ok_csv then
  csv.setup()
end

-- dropbar 配置
local ok_dropbar, dropbar = pcall(require, "dropbar")
if ok_dropbar then
  dropbar.setup()
end

-- neogen 配置
local ok_neogen, neogen = pcall(require, "neogen")
if ok_neogen then
  neogen.setup({
    snippet_engine = "nvim",
  })

  vim.keymap.set("n", "<leader>cn", function()
    require("neogen").generate()
  end, { desc = "Generate Annotations (Neogen)", silent = true })
end

-- search-replace 快捷键
vim.keymap.set("n", "<leader>sr", function()
  require("search-replace").open()
end, { desc = "Search Replace", silent = true })
