local mapkey = require("util.keymapper").mapkey

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	if client.name == "tsserver" then
		local ts_utils = require("nvim-lsp-ts-utils")

		ts_utils.setup({
			enable_import_on_completion = false,
			always_organize_imports = false,
		})

		ts_utils.setup_client(client)

		mapkey("<Leader>oo", ":TSLspOrganize<CR>", "n", opts)
		mapkey("<Leader>ox", ":TSLspRenameFile<CR>", "n", opts)
	end

	mapkey("<leader>cf", "Lspsaga finder", "n", opts) -- go to definition
	mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	mapkey("<leader>cr", "Lspsaga rename", "n", opts) -- smart rename
	mapkey("<leader>cD", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
	mapkey("<leader>cd", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	mapkey("<leader>cp", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	mapkey("<leader>cn", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer

	mapkey("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peak definition
	mapkey("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		print("python ne")
		mapkey("<Leader>oi", "PyrightOrganizeImports", "n", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "🆘️", Info = "" }

return M
