return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        qml = { "qmlfmt" },
      },
      formatters = {
        -- version mismatch with qmlformat idky
        -- qmlformat = {
        --   inherit = false,
        --   command = "qmlformat",
        --   args = { "$FILENAME" },
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
          cmd = { "qmlls6" },
        },
      },
    },
  },
}
