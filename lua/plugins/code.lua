-- 代码相关插件配置

-- blink.cmp 配置
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
  blink.setup({
    fuzzy = {
      prebuilt_binaries = {
        download = true,
      },
    },
    completion = {
      documentation = {
        auto_show_delay_ms = 10,
      },
      ghost_text = {
        enabled = false,
      },
      list = {
        selection = {
          auto_insert = false,
        },
      },
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              width = { fill = true, max = 60 },
              text = function(ctx)
                local ok_cm, cm = pcall(require, "colorful-menu")
                if ok_cm then
                  local highlights_info = cm.blink_highlights(ctx)
                  if highlights_info ~= nil then
                    return highlights_info.label
                  end
                end
                return ctx.label
              end,
              highlight = function(ctx)
                local highlights = {}
                local ok_cm, cm = pcall(require, "colorful-menu")
                if ok_cm then
                  local highlights_info = cm.blink_highlights(ctx)
                  if highlights_info ~= nil then
                    highlights = highlights_info.highlights
                  end
                end
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                end
                return highlights
              end,
            },
          },
        },
      },
    },
    keymap = {
      ["<Tab>"] = {
        "select_next",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "fallback",
      },
      ["<M-e>"] = { "hide" },
      ["<M-w>"] = { "show", "show_documentation", "hide_documentation" },
    },
  })
end

-- colorful-menu 配置
local ok_cm, cm = pcall(require, "colorful-menu")
if ok_cm then
  cm.setup()
end

-- vim-stylus (通过原生方式加载)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.styl", "*.stylus" },
  callback = function()
    vim.opt_local.filetype = "stylus"
  end,
})

-- 颜色选择器配置
local ok_colorpicker, colorpicker = pcall(require, "color-picker")
if ok_colorpicker then
  vim.keymap.set({ "n", "i" }, "<M-c>", function()
    require("color-picker").open()
  end, { desc = "Open Color Picker", silent = true })
end

-- copilot 配置
local ok_copilot, copilot = pcall(require, "copilot")
if ok_copilot then
  copilot.setup({
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "right",
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node",
  })
end
