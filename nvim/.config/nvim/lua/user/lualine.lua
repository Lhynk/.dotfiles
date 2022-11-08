local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
local provider = require("core.utils").provider

local icons = {
	c_left_separator = "",
	c_right_separator = "",
	s_left_separator = "",
	s_right_separator = "",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "nord",
		component_separators = { left = icons.c_left_separator, right = icons.c_right_separator },
		section_separators = { left = icons.s_left_separator, right = icons.s_right_separator },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { { "filename", file_status = true, path = 0 } },
		lualine_x = { provider.lsp_progress, { "diagnostics", source = { "nvim_diagnostic" } }, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
