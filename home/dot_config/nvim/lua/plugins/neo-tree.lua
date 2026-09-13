return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>o", "<cmd>Neotree reveal<cr>", desc = "Explorer (reveal current file)" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = { width = 35 },
  },
}
