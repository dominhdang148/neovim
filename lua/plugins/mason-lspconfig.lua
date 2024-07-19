local opts = {
	ensure_installed = {
		"angularls",
		"bashls",
		-- "black",
		"cssls",
		"efm",
		-- "emmet_ls",
		"eslint",
		-- "flake8",
		"html",
		-- "htmlbeautifier",
		"jsonls",
		"lua_ls",
		-- "luacheck",
		-- "prettier",
		-- "prettierd",
		"pyright",
		"solidity",
		"stylelint_lsp",
		-- "stylua",
		"tailwindcss",
		"tsserver",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
