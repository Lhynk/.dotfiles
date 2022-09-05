local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup { 
  ensure_installed = { "lua", "typescript", "javascript", "html", "json", "tsx", "http" },
  sync_install = false,
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true
  },
  autotag = {
    enable = true
  }
}
