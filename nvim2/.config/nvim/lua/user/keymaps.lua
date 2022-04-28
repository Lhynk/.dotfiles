local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    Normal = "n",
--    Insert = "i",
--    Visual = "v",
--    Visual Block = "x"
--    Term = "t"
--    Command = "c"

-- Normal --
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Reize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers (tabs)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bc", ":bd<CR>", opts)
keymap("n", "<leader>bae", ":%bd|e#|bd#<CR>", opts)
keymap("n", "<leader>bad", ":%bd|bd#<CR>", opts)
--keymap("n", "<leader>bl", ":BufferLinePick<CR>", opts)

-- Insert --
-- jk to return Normal mode
keymap("i", "jk", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", ">", "<gv", opts)
keymap("v", "<", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .--2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope --
keymap("n", "<leader>f", "<cmd> lua require'telescope.builtin'.find_files()<cr>", opts)

-- NvimTree --
keymap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<F5>", ":NvimTreeToggle<CR>", opts)

-- Formatting
keymap("n", "<leader>df", ":Format<CR>", opts)
