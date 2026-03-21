return {
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
  {
    "echasnovski/mini.map",
    event = "VeryLazy",
    opts = {},
    config = function()
      local map = require("mini.map")
      map.setup({
        window = {
          winblend = 0,
        },
      })
      -- Dim minimap text to ~40% opacity against the background
      vim.api.nvim_set_hl(0, "MiniMapNormal", { link = "Comment" })
      map.open()
    end,
    keys = {
      { "<leader>um", function() require("mini.map").toggle() end, desc = "Toggle minimap" },
    },
  },
}
