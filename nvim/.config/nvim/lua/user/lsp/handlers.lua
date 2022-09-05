local M = {}

M.setup = function()
end

local function lsp_configuration(_)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  vim.diagnostic.config({
    virtual_text = false,
    float = {
      border= 'rounded'
    }
  })
end

M.on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false

  if client.name == "null-ls" then
    client.resolved_capabilities.document_formatting = true
  end

  lsp_configuration(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
