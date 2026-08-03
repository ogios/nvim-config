vim.filetype.add({
  extension = {
    xacro = "xml",
    urdf = "xml",
    srdf = "xml",
  },
})

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        xml = { "xmlformat" },
      },
      formatters = {
        xmlformat = {
          command = "xmlformat",
          args = { "--indent", "2", "-" },
          stdin = true,
        },
      },
    },
  },
}
