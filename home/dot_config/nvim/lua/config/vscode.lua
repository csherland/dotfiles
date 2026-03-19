local map = vim.keymap.set
local vscode = require("vscode")

-- Exit insert mode with jj
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Keep visual selection when indenting
map("x", "<", "<gv", { desc = "Indent left and reselect" })
map("x", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste (don't lose register when pasting over selection)
map("x", "p", [["_dP]], { desc = "Paste without losing register" })

-- Map leader keys to VS Code equivalents
map("n", "<leader>ff", function() vscode.action("workbench.action.quickOpen") end, { desc = "Find files" })
map("n", "<leader>fg", function() vscode.action("workbench.action.findInFiles") end, { desc = "Find in files" })
map("n", "<leader>ca", function() vscode.action("editor.action.quickFix") end, { desc = "Code actions" })
map("n", "<leader>rn", function() vscode.action("editor.action.rename") end, { desc = "Rename symbol" })
map("n", "<leader>cf", function() vscode.action("editor.action.formatDocument") end, { desc = "Format document" })
map("n", "<leader>e", function() vscode.action("workbench.view.explorer") end, { desc = "File explorer" })
map("n", "<leader>xx", function() vscode.action("workbench.actions.view.problems") end, { desc = "Problems panel" })
map("n", "gr", function() vscode.action("editor.action.goToReferences") end, { desc = "Go to references" })
map("n", "gd", function() vscode.action("editor.action.revealDefinition") end, { desc = "Go to definition" })
map("n", "gi", function() vscode.action("editor.action.goToImplementation") end, { desc = "Go to implementation" })
