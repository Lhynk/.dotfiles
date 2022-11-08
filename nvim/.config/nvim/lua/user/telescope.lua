local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		winblend = 10,
		file_ignore_patterns = { "node_modules" },
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.65,
			height = 0.85,
			prompt_position = "top",
			horizontal = {
				preview_width = 0.60,
			},
		},
		mappings = {
			i = {
				-- Navigation
				["<C-j>"] = actions.move_selection_next, -- Move next item
				["<C-k>"] = actions.move_selection_previous, -- Move prev item

				["<C-x>"] = actions.select_horizontal, -- Open file in horizontal split
				["<C-v>"] = actions.select_vertical, -- Open file in vertical split
				["<esc>"] = actions.close, -- Close telescope
				["<cr>"] = actions.select_tab,
			},
		},
	},
	pickers = {
		diagnostics = {
			theme = "ivy",
			winblend = 30,
		},
		buffers = {
			theme = "dropdown",
		},
	},
	extensions = {
		fzf = {},
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<c-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["-"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
--telescope.load_extension("fzf")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
