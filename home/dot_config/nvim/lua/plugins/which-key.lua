return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    spec = {
      {
        mode = { "n", "x" },
        { "<leader>f", group = "find" },
        { "<leader>c", group = "code" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>r", group = "refactor" },
        { "<leader>d", group = "diagnostics/dismiss" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "z", group = "fold" },
      },
    },
  },
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Keymaps" },
    { "<c-w><space>", function() require("which-key").show({ keys = "<c-w>", loop = true }) end, desc = "Window Hydra Mode" },
  },
}
