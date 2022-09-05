  local null_ls_status_ok, prettier = pcall(require, "prettier")
  if not null_ls_status_ok then
    return
  end

  prettier.setup({
    bin = 'prettierd',
    filetypes = {
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "json",
      "scss",
      "less"
    }
  })
