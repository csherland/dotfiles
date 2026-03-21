return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = function()
    return {
    options = {
      separator_style = "slant",
      always_show_bufferline = false,
      close_command = "bdelete! %d",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Bold",
          text_align = "center",
        },
      },
    },
  }
  end,
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
  },
}
