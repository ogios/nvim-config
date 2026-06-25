-- vim.pack 插件声明
-- 使用 neovim 0.12 内置插件管理器

-- 添加所有插件
vim.pack.add({
  -- 代码补全
  "https://github.com/saghen/blink.cmp",
  "https://github.com/xzbdmw/colorful-menu.nvim",

  -- LSP相关
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/dnlhc/glance.nvim",

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",

  -- UI插件
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/echasnovski/mini.indentscope",
  "https://github.com/echasnovski/mini.diff",
  "https://github.com/echasnovski/mini.move",
  "https://github.com/echasnovski/mini.surround",
  "https://github.com/echasnovski/mini.pairs",
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/echasnovski/mini.hipatterns",

  -- 编辑器功能
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/folke/persistence.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/akinsho/git-conflict.nvim",

  -- 语言支持
  "https://github.com/mrcjkb/rustaceanvim",
  "https://github.com/folke/lazydev.nvim",

  -- 调试和测试
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/jay-babu/mason-nvim-dap.nvim",
  "https://github.com/theHamsta/nvim-dap-virtual-text",

  -- 工具插件
  "https://github.com/CRAG666/code_runner.nvim",
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/andymass/vim-matchup",
  "https://github.com/m-demare/hlargs.nvim",
  "https://github.com/roobert/search-replace.nvim",
  "https://github.com/hat0uma/csvview.nvim",
  "https://github.com/danymat/neogen",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/Bekaboo/dropbar.nvim",

  -- 依赖插件
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
})

-- Treesitter 语言安装
local ts_parsers = {
  "bash", "c", "dockerfile", "fish", "git_config", "git_rebase", "gitattributes",
  "gitcommit", "gitignore", "go", "gomod", "gosum", "html", "javascript", "json",
  "lua", "make", "markdown", "python", "rust", "sql", "toml", "tsx", "typescript",
  "typst", "vim", "yaml", "zig", "ron"
}

local ok, nts = pcall(require, "nvim-treesitter")
if ok then
  nts.install(ts_parsers)
end

-- 创建更新命令
vim.api.nvim_create_user_command("PackUpdate", function()
  require("vim.pack").update()
end, { desc = "Update all plugins using vim.pack" })

-- 创建安装命令
vim.api.nvim_create_user_command("PackInstall", function()
  require("vim.pack").install()
end, { desc = "Install all plugins using vim.pack" })

-- 加载所有插件配置
require("plugins.ui")
require("plugins.editor")
require("plugins.code")
require("plugins.lsp")
require("plugins.lang")

