vim.o.guifont = "JetBrainsMonoNL Nerd Font:h16"
local key = vim.keymap
if vim.g.neovide then
  key.set({ "n", "v" }, "<C-S-v>", '"+p')
  -- vim.g.neovide_underline_automatic_scaling = true

  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0

  -- vim.g.neovide_scroll_animation_length = 0.15
  -- vim.g.neovide_cursor_animation_length = 0.05
  -- vim.g.neovide_cursor_trail_size = 0.15
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_stroke_scale = 2.0

  -- vim.g.neovide_fullscreen = true
  -- vim.g.neovide_profiler = true
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_smooth_blink = true
  -- vim.g.neovide_refresh_rate = 144
end
