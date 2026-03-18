return {
  -- Auto-detect indent settings per file
  { "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } },

  -- Highlight TODO/FIXME/HACK comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "Find TODOs" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO" },
    },
    opts = {},
  },

  -- Icons (shared dependency)
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
