  local saga_status_ok, lspSaga = pcall(require, "lspsaga")
  if not saga_status_ok then
    return
  end

lspSaga.init_lsp_saga({
    border_style = 'rounded',
    saga_winblend = 30
  })

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<A-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<A-k>', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', '<C-k>', '<cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', opts)
