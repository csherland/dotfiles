-- Set leader keys before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
  require("config.vscode")
  return
end

-- Load core config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap and load plugins
require("config.lazy")
