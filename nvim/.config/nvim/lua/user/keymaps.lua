local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<A-q>", ":qa<CR>", opts)
keymap("n", "x", '"_x', opts) -- Don't yank with x'
keymap("n", "dw", 'vb"_d', opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs
keymap("n", "te", ":tabedit<cr>", opts)

-- Navigate tabs
-- keymap('n', '<S-l>', ':tabnext<CR>', opts)
-- keymap('n', '<S-h>', ':tabprevious<CR>', optsl
-- keymap('n', '<leader>q', ':tabclose<CR>', opts)
-- keymap('n', '<leader>tsa', ':wa', opts)

-- keymap('n', '<S-l>', ':bnext<CR>', opts)
-- keymap('n', '<S-h>', ':bprevious<CR>', opts)
-- keymap('n', '<leader>q', ':bd<CR>', opts)
-- keymap('n', '<leader>bae', ':%bd|e#|bd#<CR>', opts)
-- keymap('n', '<leader>bad', ':%bd|bd#<CR>', opts)
-- keymap('n', '<leader>bwa', ':wa<CR>', opts)
-- keymap('n', '<leader>bl', ':BufferLinePick<CR>', opts)

-- Insert --
-- jk to return Normal mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", "<gv", opts)
keymap("v", "<", ">gv", opts)

-- Move text up and down
keymap("x", "<A-j>", ":m .+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":m .-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("x", "<A-k>", ":m .--2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- keymap("x", "J", ':move ">+1<CR>gv-gv', opts)
-- keymap("x", "K", ':move "<-2<CR>gv-gv', opts)
-- keymap("x", "<A-j>", ':move ">+1<CR>gv-gv', opts)
-- keymap("x", "<A-k>", ':move "<-2<CR>gv-gv', opts)

-- Telescope --
keymap("n", "<leader>ff", '<cmd> lua require"telescope.builtin".find_files()<cr>', opts)
keymap("n", "<leader>fb", '<cmd> lua require"telescope.builtin".buffers({initial_mode="normal"})<cr>', opts)
keymap("n", "<leader>fs", '<cmd> lua require"telescope.builtin".current_buffer_fuzzy_find()<cr>', opts)
keymap("n", "<leader>fw", '<cmd> lua require"telescope.builtin".live_grep()<cr>', opts)
keymap("n", "<leader>e", ":Telescope file_browser path=%:p:h initial_mode=normal<cr>", opts)
keymap("n", "gl", '<cmd> lua require"telescope.builtin".diagnostics({bufnr=0,initial_mode="normal"})<cr>', opts)

-- NvimTree --:
keymap("n", "<leader>b", ":NvimTreeFindFileToggle<CR>", opts)

-- Formatting
keymap("n", "<leader>df", ":Format<CR>", opts)

-- BarBar
keymap("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", opts)
