-- 自动命令设置
-- 移除LazyVim相关配置

local function my_startup_function()
  -- 通知启动时间
  local startuptime = vim.fn.reltime(vim.g.start_time)
  vim.notify("startup in: " .. vim.fn.reltimestr(startuptime) .. "s", vim.log.levels.INFO)

  -- 恢复旧会话
  vim.schedule(function()
    if vim.fn.argc() == 0 then
      local ok, persistence = pcall(require, "persistence")
      if ok then
        persistence.load()
      end
    end

    -- 每5秒自动保存会话
    local timer = vim.uv.new_timer()
    timer:start(
      5000,
      5000,
      vim.schedule_wrap(function()
        local ok, persistence = pcall(require, "persistence")
        if ok then
          persistence.save()
        end
      end)
    )
  end)
end

-- 记录启动时间
vim.g.start_time = vim.fn.reltime()

-- 创建自动命令组
local augroup = vim.api.nvim_create_augroup("StartupGroup", { clear = true })

-- 在UIEnter事件时调用启动函数
vim.api.nvim_create_autocmd("UIEnter", {
  group = augroup,
  callback = my_startup_function,
  once = true, -- 只在第一次UI附加时运行
})
