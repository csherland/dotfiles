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

  -- Find and replace
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>sr", function() require("grug-far").open() end, desc = "Search and Replace" },
      { "<leader>sw", function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end, desc = "Replace word under cursor" },
      { "<leader>sf", function() require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } }) end, desc = "Replace in current file" },
      { "<leader>sw", function()
        require("grug-far").open({ prefills = { search = require("grug-far").get_visual_selection() } })
      end, mode = "v", desc = "Replace selection" },
    },
    opts = {},
  },

  -- Icons (shared dependency)
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
