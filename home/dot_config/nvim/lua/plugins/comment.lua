return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    lazy = false, -- or `event = "VeryLazy"` to defer loading
  },
}
