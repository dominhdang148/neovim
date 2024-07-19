local keymap = vim.keymap.set
local optsSilent = { noremap = true, silent = true }
local opts = { noremap = true, silent = false }

-- delete a word backwords
keymap("n", "dw", 'vb"_d', optsSilent)

-- Pane and Window Navigation
keymap("n", "<C-h>", "<C-w>h", optsSilent) -- Navigate Left
keymap("n", "<C-j>", "<C-w>j", optsSilent) -- Navigate Down
keymap("n", "<C-k>", "<C-w>k", optsSilent) -- Navigate Up
keymap("n", "<C-l>", "<C-w>l", optsSilent) -- Navigate Right
keymap("n", "<C-h>", "wincmd h", optsSilent) -- Navigate Left
keymap("n", "<C-j>", "wincmd j", optsSilent) -- Navigate Down
keymap("n", "<C-k>", "wincmd k", optsSilent) -- Navigate Up
keymap("n", "<C-l>", "wincmd l", optsSilent) -- Navigate Right
keymap("n", "<C-h>", "TmuxNavigateLeft", optsSilent) -- Navigate Left
keymap("n", "<C-j>", "TmuxNavigateDown", optsSilent) -- Navigate Down
keymap("n", "<C-k>", "TmuxNavigateUp", optsSilent) -- Navigate Up
keymap("n", "<C-l>", "TmuxNavigateRight", optsSilent) -- Navigate Right

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", optsSilent)
keymap("n", "<Down>", ":resize +2<CR>", optsSilent)
keymap("n", "<Left>", ":vertical resize -2<CR>", optsSilent)
keymap("n", "<Right>", ":vertical resize +2<CR>", optsSilent)

-- Indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Do not yank with x
keymap("n", "x", '"_x', optsSilent)

-- Bufferline
keymap("n", "<Tab>", ":bn<CR>", optsSilent)
keymap("n", "<S-Tab>", ":bp<CR>", optsSilent)

-- Zen Mode
keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
keymap("n", "<leader>zf", ":TZFocus<CR>", {})
keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
