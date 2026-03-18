return {
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>o",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open file explorer (current file)",
      },
      {
        "<leader>O",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open file explorer (cwd)",
      },
    },
    opts = {
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "H",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {},
  },
}
