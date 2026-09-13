-- Keymaps shared by terminal Neovim and VS Code (vscode-neovim). Loaded on
-- VeryLazy in both modes. LazyVim's defaults live in lazyvim/config/keymaps.lua;
-- this file only adds personal maps on top of them.
local map = vim.keymap.set

-- Clear search highlight (LazyVim also does this on <Esc>)
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Toggle comments (built-in gc/gcc)
map("n", "<C-Space>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-Space>", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<leader>cc", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>cc", "gc", { remap = true, desc = "Toggle comment" })

-- Exit insert mode with jj (not in visual mode: it would delay every `j` by timeoutlen)
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Move lines up/down in visual mode (LazyVim also has <A-j>/<A-k>)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })

-- Paste over a selection without losing the register
map("x", "p", [["_dP]], { desc = "Paste without losing register" })

-- Rename symbol (LazyVim also maps <leader>cr)
map("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename symbol (inline preview)" })

if vim.g.vscode then
  require("config.vscode")
else
  -- Close buffer, keeping the window layout
  map("n", "<C-x>", function()
    Snacks.bufdelete()
  end, { desc = "Close buffer" })
end
