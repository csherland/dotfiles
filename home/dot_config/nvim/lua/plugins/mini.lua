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

      -- Only open minimap for real file buffers
      local function should_show_map()
        local bt = vim.bo.buftype
        local ft = vim.bo.filetype
        local ignored_ft = { "snacks_dashboard", "dashboard", "alpha", "starter", "lazy", "neo-tree" }
        if bt ~= "" then return false end
        return not vim.tbl_contains(ignored_ft, ft)
      end

      -- Open on real files, close on non-file buffers
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          vim.schedule(function()
            if should_show_map() then
              map.open()
            else
              map.close()
            end
          end)
        end,
      })

      if should_show_map() then
        map.open()
      end
    end,
    keys = {
      { "<leader>um", function() require("mini.map").toggle() end, desc = "Toggle minimap" },
    },
  },
}
