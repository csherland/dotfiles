local neotree = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  ---@module "neo-tree",
  opts = {},
}

return { neotree }
