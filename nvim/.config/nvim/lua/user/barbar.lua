local status_ok, barbar = pcall(require, 'bufferline')
if not status_ok then return end

barbar.setup ({
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    color_icons = true,
    show_close_icon = false,
    show_buffer_close_icons = true,
    diagnostics = 'nvim_lsp'
  }
})
