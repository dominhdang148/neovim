local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.linebreak = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menu,menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.showmode = false
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus") -- for unix
--opt.clipboard:prepend { 'unnamed', 'unnamedplus' } -- for windows
opt.modifiable = true
--opt.guicursor =
--	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"
opt.whichwrap = "b,s,<,>,[,],h,l"

-- setting folds
opt.foldmethod = "indent"
opt.foldenable = true
opt.foldlevel = 99

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})
