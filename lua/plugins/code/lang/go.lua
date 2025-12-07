return {
  -- go
  {
    "olexsmir/gopher.nvim",
    event = { "BufEnter *.go" },
    ft = { "go", "gomod" },
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
  },

  { import = "lazyvim.plugins.extras.lang.go" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
      },
    },
  },
}
