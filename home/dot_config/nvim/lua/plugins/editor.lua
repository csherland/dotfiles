return {
  -- Auto-detect indent settings per file
  { "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } },

  -- which-key group for the personal <leader>r* maps
  { "folke/which-key.nvim", opts = { spec = { { "<leader>r", group = "refactor" } } } },
}
