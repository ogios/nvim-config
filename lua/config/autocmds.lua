-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function my_startup_function()
  -- notify time
  LazyVim.info("startup in: " .. require("lazy.stats").stats().startuptime .. "ms", { title = "Startup Time" })

  -- enter old session
  vim.schedule(function()
    if vim.fn.argc() == 0 then
      require("persistence").load()
    end

    local timer = vim.uv.new_timer()
    timer:start(
      5000,
      5000,
      vim.schedule_wrap(function()
        require("persistence").save()
      end)
    )
  end)
end

-- Create an autocmd group for managing your autocommands
local augroup = vim.api.nvim_create_augroup("StartupGroup", { clear = true })

-- Create the autocommand to call your function on the "UIEnter" event
vim.api.nvim_create_autocmd("UIEnter", {
  group = augroup,
  callback = my_startup_function,
  once = true, -- Set once = true if you only want it to run the first time a UI attaches
})
