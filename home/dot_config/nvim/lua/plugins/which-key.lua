return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>c", group = "code" },
      { "<leader>g", group = "git" },
      { "<leader>r", group = "refactor" },
      { "<leader>d", group = "diagnostics/dismiss" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
}
