local opt = vim.opt

-- Clipboard: sync with system, but not over SSH (preserve OSC 52)
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation: 2 spaces
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

-- Display
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- Misc
opt.swapfile = false
opt.updatetime = 200
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"
opt.showmode = false -- lualine shows mode
