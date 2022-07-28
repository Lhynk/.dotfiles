  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug= true,
    sources = {
      formatting.prettier.with { extra_args = {"--single-quote", "--jsx-single-quote"} },
      diagnostics.eslint
    },
    on_attach = function(client)
    vim.cmd [[
     augroup LspFormat
       autocmd! * <buffer>
       autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,10000)
     augroup END
     ]]
   end
  })
