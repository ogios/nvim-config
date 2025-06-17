function reload_current_buffer()
  -- get the file  path of current buffer
  local file_path = vim.api.nvim_buf_get_name(0)
  print("Reloading file: " .. file_path)

  -- close current buffer
  Snacks.bufdelete()

  -- open the file again
  vim.cmd("edit " .. file_path)
end

vim.keymap.set("n", "<leader>rl", reload_current_buffer, { desc = "Reload current buffer" })

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- qml = { "qmlfmt" },
        qml = { lsp_format = "fallback" },
      },
      formatters = {
        -- FIXME: bug
        -- qmlformat = {
        --   inherit = false,
        --   command = "/usr/lib/qt6/bin/qmlformat",
        --   -- args = { "$FILENAME", "--objects-spacing", "--functions-spacing", "-w", "2", "-f", "-n" },
        --   args = { "-i", "$FILENAME" },
        -- },
        qmlfmt = {
          command = "qmlfmt",
          args = { "-i", "2" },
          stdin = true,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          filetypes = { "qml", "qmljs", "qmldir" },
          -- cmd = { "/usr/lib/qt6/bin/qmlls", "-E", "-b", "/home/ogios/.config/quickshell/build" },
          cmd = { "/usr/lib/qt6/bin/qmlls", "-E" },
          single_file_support = false,
          -- on_exit = function()
          --   vim.schedule(reload_current_buffer)
          -- end,
          log_level = vim.lsp.protocol.MessageType.Debug,
        },
      },
    },
  },
}
