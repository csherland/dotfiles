local map = vim.keymap.set

-- Window navigation: <C-h/j/k/l> are provided by vim-tmux-navigator (see plugins/tmux.lua)

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Toggle comments (built-in gc/gcc in Neovim 0.10+)
map("n", "<C-Space>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-Space>", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<leader>cc", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>cc", "gc", { remap = true, desc = "Toggle comment" })

-- Buffer navigation: <S-h>/<S-l> come from bufferline. (<C-m> is Enter, so never map it.)
map("n", "<C-x>", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })

-- Exit insert mode with jj (not in visual mode: it would delay every `j` by timeoutlen)
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Keep visual selection when indenting
map("x", "<", "<gv", { desc = "Indent left and reselect" })
map("x", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })

-- Better paste (don't lose register when pasting over selection)
map("x", "p", [["_dP]], { desc = "Paste without losing register" })
