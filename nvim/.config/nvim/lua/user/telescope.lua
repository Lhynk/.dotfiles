local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup{
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    winblend = 10,
    file_ignore_patterns = {"node_modules"},
    mappings = {
      i = {
        -- Navigation
        ["<C-j>"] = actions.move_selection_next,   -- Move next item
        ["<C-k>"] = actions.move_selection_previous,   -- Move prev item

        ["<C-x>"] = actions.select_horizontal,   -- Open file in horizontal split
        ["<C-v>"] = actions.select_vertical,   -- Open file in vertical split
        ["<C-t>"] = actions.select_tab,   -- Open file in new tab

        ["<C-h>"] = actions.which_key,   -- Get help about current keymaps

        ["<esc>"] = actions.close,   -- Close telescope
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false
    }
  }
}
