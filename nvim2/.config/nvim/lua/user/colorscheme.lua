-- Set theme
local colorscheme = "gruvbox-material"

if colorscheme == "gruvbox-material" then
  vim.o.background = "dark"
  vim.g.gruvbox_material_background = "soft"
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_enable_bold = 1
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end

