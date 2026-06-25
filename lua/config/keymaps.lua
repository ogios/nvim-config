-- 快捷键设置
-- 移除LazyVim相关配置，使用原生vim.keymap.set

-- 删除一些不需要的快捷键
local D = {
  n = {
    "<leader>/",
    "<M-\\>",
    "<c-/>",
  },
  t = {
    "<M-\\>",
    "<C-/>",
  },
}

for mode, modeval in pairs(D) do
  for _, val in pairs(modeval) do
    pcall(function()
      vim.keymap.del(mode, val, { clear = true })
    end)
  end
end

-- 通用快捷键
vim.keymap.set("n", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })
vim.keymap.set("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- 插入模式快捷键
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line", silent = true })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line", silent = true })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left", silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right", silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down", silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up", silent = true })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode", silent = true })

-- 终端模式快捷键
vim.keymap.set("t", "<C-n><C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true })

-- 普通模式快捷键
vim.keymap.set("n", "<Esc>", ":noh <CR>", { desc = "Clear highlights", silent = true })
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file", silent = true })
vim.keymap.set("n", "qw", "viw", { desc = "Select word in visual mode", silent = true })

-- LSP快捷键
vim.keymap.set("n", "<leader>ld", "<CMD>Glance definitions<CR>", { desc = "Goto Definition", silent = true })
vim.keymap.set("n", "<leader>lr", "<CMD>Glance references<CR>", { desc = "Goto References", silent = true })
vim.keymap.set("n", "<leader>lY", "<CMD>Glance type_definitions<CR>", { desc = "Goto Type Definition", silent = true })
vim.keymap.set("n", "<leader>lI", "<CMD>Glance implementations<CR>", { desc = "Goto Implementation", silent = true })
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Goto Declaration", silent = true })

-- 窗口大小调整
vim.keymap.set("n", "<C-A-Up>", "<CMD>resize +5<CR>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<C-A-Down>", "<CMD>resize -5<CR>", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<C-A-Left>", "<CMD>vertical resize -5<CR>", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<C-A-Right>", "<CMD>vertical resize +5<CR>", { desc = "Increase window width", silent = true })

-- 缓冲区操作
vim.keymap.set("n", "<leader>dq", "<CMD>bdelete<CR>", { desc = "Delete buffer", silent = true })
