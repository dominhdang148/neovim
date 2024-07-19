local optsNormalMode = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
	expr = false, -- use `expr` when creating keymaps
}

local optsVisualMode = {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
	expr = false, -- use `expr` when creating keymaps
}

local keyMapsNormalMode = {
	b = {
		name = "Buffer",
		d = { ":bd<CR>", "Delete Current Buffer" },
		f = { ":bf<CR>", "First Buffer" },
		l = { ":bl<CR>", "Last Buffer" },
		c = { ":%bd|e#<CR>", "Clear all buffers" },
	},
	h = {
		":nohl<CR>",
		"Nohl Search",
	},
	-- Telescope
	f = {
		name = "Telescope",
	},
	-- Direction Navigation
	n = {
		name = "Nvim Tree",
		r = {
			":NvimTreeRefresh<CR>",
			"Nvim Tree Refresh",
		},
		c = {
			":NvimTreeCollapse<CR>",
			"Nvim Tree Collapse",
		},

		b = {
			":NvimTreeCollapseKeepBuffers<CR>",
			"Nvim Tree Collapse Keep Buffers",
		},
	},
	m = {
		":NvimTreeFocus<CR>",
		"Nvim Tree Focus",
	},
	e = {
		":NvimTreeToggle<CR>",
		"Nvim Tree Toggle",
	},
	-- File Path
	p = {
		name = "File Path",
		a = {
			":echo expand('%:p')<CR>",
			"Show Full File Path",
		},
	},
	-- Lsp Saga
	c = {
		name = "Lspsaga",
	},
	g = {
		name = "Lspsaga Definition",
	},
	o = {
		name = "Organize",
	},
	z = {
		name = "Zen Mode",
	},
	-- Search
	--
	s = {
		name = "Search",
		c = {
			":%s/<c-r><c-w>//gn<cr>",
			"Count nr of occurrences of word under cursor",
		},
	},
}

local keyMapsVisualMode = {
	s = {
		name = "Search",
		c = {
			":<c-u>%s/<c-r>*//gn<cr>",
			"Count nr of occurrences of visual selection",
		},
	},
}

local config = function()
	local wk = require("which-key")

	wk.register(keyMapsNormalMode, optsNormalMode)
	wk.register(keyMapsVisualMode, optsVisualMode)
end

return {
	"folke/which-key.nvim",
	lazy = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = config,
	opts = {},
}
