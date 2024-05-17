-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false

-- Backup
vim.o.swapfile = false
vim.o.backup = false

-- Search
vim.o.incsearch = true
vim.o.mouse = "a"

-- Line number
vim.wo.number = true
vim.wo.relativenumber = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Scroll
vim.o.scrolloff = 4

-- Colors
vim.opt.termguicolors = true

-- Clipboard
vim.o.clipboard = "unnamed,unnamedplus"

-- Netrw
vim.g.loaded_netrwPlugin = 0

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
