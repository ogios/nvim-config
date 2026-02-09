return {
  "ErickKramer/nvim-ros2",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    picker = "snacks",
    autocmds = true,
    treesitter = true,
  },
  keys = {
    {
      "<leader>li",
      function()
        require("nvim-ros2").pickers.interfaces()
      end,
      desc = "[ROS 2]: List interfaces",
    },
    {
      "<leader>ln",
      function()
        require("nvim-ros2").pickers.nodes()
      end,
      desc = "[ROS 2]: List nodes",
    },
    {
      "<leader>la",
      function()
        require("nvim-ros2").pickers.actions()
      end,
      desc = "[ROS 2]: List actions",
    },
    {
      "<leader>lt",
      function()
        require("nvim-ros2").pickers.topics_info()
      end,
      desc = "[ROS 2]: List topics with info",
    },
    {
      "<leader>le",
      function()
        require("nvim-ros2").pickers.topics_echo()
      end,
      desc = "[ROS 2]: List topics with echo",
    },
    {
      "<leader>ls",
      function()
        require("nvim-ros2").pickers.services()
      end,
      desc = "[ROS 2]: List services",
    },
  },
}
