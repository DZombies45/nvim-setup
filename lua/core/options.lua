local options = {
	autoindent = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	softtabstop = 2,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	showtabline = 4,
	mouse = "a",
	showmode = false,
	breakindent = true,
	undofile = true,
	ignorecase = true,
	smartcase = true,
	smartindent = true,
	signcolumn = "yes",
	updatetime = 250,
	timeoutlen = 300,
	splitright = true,
	splitbelow = true,
	list = true,
	listchars = { tab = "󱋱 ", trail = "·", nbsp = "␣" },
	inccommand = "split",
	cursorline = true,
	scrolloff = 10,
	sidescrolloff = 15,
	wrap = false,
	linebreak = true,
	termguicolors = true,
	whichwrap = "bs<>[]hl",
	writebackup = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
