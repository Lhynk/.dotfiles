local options = {
	backup = false,			                			-- doesn't creates a backup file
	clipboard = "unnamedplus",								-- allows neovim to access the system clipboard
	cmdheight = 2,														-- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" },	-- mostly jus for cmp
	conceallevel = 0,													-- so that '' is visible in markdown files
	fileencoding = "utf-8",										-- the encoding written to a file
	hlsearch = true,													-- highlight all matches on previous search pattern
	ignorecase = true,												-- ignore case in search patterns
	mouse = "a",															-- allow the mouse
	pumheight = 10,														-- pop up menu height
	showtabline = 2,													-- always show tabs
	smartcase = true,													-- smart case
	smartindent = true,												-- just smart indent
	splitbelow = true,												-- force all horizontal splits to go below active window
	splitright = true,												-- force all vertical splits to go the right of active window
	swapfile = false,													-- doesn't creates a swap file
	timeoutlen = 500,												-- time to wait for a mapped sequence to complete
	updatetime = 300,													-- faster completion
	writebackup = false,											-- search help for this
	expandtab = true,													-- convert tabs to spaces
	shiftwidth = 2,														-- spaces number for each indentation
	tabstop = 2,															-- insert 2 spaces for a tab
	cursorline = true,												-- highlight the current line
	number = true,														-- active number line
	relativenumber = true,										-- active relative number line	
	numberwidth = 4,													-- set number column to width 4
	signcolumn = "yes",												-- always show the sign column
	wrap = false,															-- display lines as one long line
	scrolloff = 8,														-- keep showing 8 lines before the end of the view
	sidescrolloff = 8,												-- same as above just on side scrolling
	guifont = "monospace:h17",								-- font for graphical neovim applications
  termguicolors = true                      -- active terminal gui colors
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
