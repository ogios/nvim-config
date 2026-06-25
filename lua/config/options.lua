-- Neovim 选项设置
-- 移除LazyVim相关配置，使用原生设置

-- 基础设置
vim.opt.wrap = true
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- 行号设置
vim.opt.number = true
vim.opt.relativenumber = false

-- Markdown预览设置
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1

-- 加载Neovide配置（如果存在）
local ok, _ = pcall(require, "util.neovide")
if not ok then
  -- Neovide配置不存在，跳过
end
