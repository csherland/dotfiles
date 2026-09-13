return {
  -- Seamless <C-h/j/k/l> navigation across nvim splits and tmux panes
  {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Go to left window/pane" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Go to lower window/pane" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Go to upper window/pane" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Go to right window/pane" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Go to previous window/pane" },
    },
  },
}
