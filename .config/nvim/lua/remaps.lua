local opts = { noremap = true, silent = true }

-- Leader
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Preserves highlighted word on register after pasting over selection
vim.keymap.set("x", "<leader>p", '"_dP')

-- OS Register yanks
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Format
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Vim Tmux Navigator
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")

-- Toggle Term
vim.keymap.set("t", "<C-/>", ":ToggleTerm direction=horizontal size=10<CR>")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVGzz", opts)

-- TODO Comments
vim.keymap.set("n", "<leader>tr", ":Trouble todo<CR>")
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>")
