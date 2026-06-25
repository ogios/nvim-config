-- vim.o.guifont = "JetBrainsMono Nerd Font:h16"
-- vim.o.guifont = "0xProto Nerd Font:h16"
-- vim.o.guifont = "FantasqueSansM Nerd Font:h18"
-- vim.o.guifont = "ComicShannsMono Nerd Font:h18"
-- vim.o.guifont = "TX-02:h16"
-- vim.o.guifont = "PragmataPro Mono Liga"
vim.o.guifont = "PragmataPro"
-- vim.o.linespace = 10
vim.g.neovide_scale_factor = 1.25

if vim.g.neovide then
  vim.keymap.set("i", "<C-S-v>", "<C-r><C-o>+") -- paste (insert)
  vim.keymap.set("n", "<C-S-v>", "i<C-r><C-o>+<Esc>l") -- paste (normal)
  vim.keymap.set("x", "<C-S-v>", '"+P') -- paste (visual)
  vim.keymap.set("c", "<C-S-v>", "<C-r>+") -- paste (command)
  vim.keymap.set("t", "<C-S-v>", [[<C-\><C-N>"+P]]) -- Paste terminal mode

  -- vim.g.neovide_underline_automatic_scaling = true

  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0

  -- vim.g.neovide_scroll_animation_length = 0.15
  -- vim.g.neovide_cursor_animation_length = 0.05
  -- vim.g.neovide_cursor_trail_size = 0.15
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_stroke_scale = 0.6

  -- vim.g.neovide_fullscreen = true
  -- vim.g.neovide_profiler = true
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_smooth_blink = true
  -- vim.g.neovide_refresh_rate = 144
end
