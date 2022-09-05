local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
  return
end

rest.setup({
  result = {
    show_url = true,
    show_http_info = false,
    show_headers = true
  },
  env_file = "rest.env"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function ()
    local buff = tonumber(vim.fn.expand("<abuf>"), 10)
    vim.keymap.set("n", "<leader>rn", rest.run, {noremap = true, buffer = buff })
  end
})
