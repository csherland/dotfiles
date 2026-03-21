local map = vim.keymap.set

-- Window navigation
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Toggle comments (built-in gc/gcc in Neovim 0.10+)
map("n", "<C-Space>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-Space>", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<leader>cc", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>cc", "gc", { remap = true, desc = "Toggle comment" })

-- Buffer navigation
map("n", "<C-m>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-b>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<C-x>", "<cmd>bp<CR><cmd>bd #<CR>", { desc = "Close buffer" })

-- Exit insert/visual mode with jj
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("v", "jj", "<Esc>", { desc = "Exit visual mode" })

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
