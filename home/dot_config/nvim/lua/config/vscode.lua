-- VS Code-only keymaps (vscode-neovim). Required from config/keymaps.lua when
-- vim.g.vscode is set, after the shared maps. LazyVim's vscode extra already
-- trims the plugin set and maps <leader><space>, <leader>/, <leader>ss.
local map = vim.keymap.set
local vscode = require("vscode")

local function action(name)
  return function()
    vscode.action(name)
  end
end

map("n", "<leader>ff", action("workbench.action.quickOpen"), { desc = "Find files" })
map("n", "<leader>fg", action("workbench.action.findInFiles"), { desc = "Find in files" })
map("n", "<leader>ca", action("editor.action.quickFix"), { desc = "Code actions" })
map("n", "<leader>rn", action("editor.action.rename"), { desc = "Rename symbol" })
map("n", "<leader>cf", action("editor.action.formatDocument"), { desc = "Format document" })
map("n", "<leader>e", action("workbench.view.explorer"), { desc = "File explorer" })
map("n", "<leader>xx", action("workbench.actions.view.problems"), { desc = "Problems panel" })
map({ "n", "v" }, "<leader>cc", action("editor.action.commentLine"), { desc = "Toggle comment" })
map("n", "<C-x>", action("workbench.action.closeActiveEditor"), { desc = "Close editor" })
map("n", "gr", action("editor.action.goToReferences"), { desc = "Go to references" })
map("n", "gd", action("editor.action.revealDefinition"), { desc = "Go to definition" })
map("n", "gi", action("editor.action.goToImplementation"), { desc = "Go to implementation" })
