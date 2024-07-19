local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	local langServersDefault = {
		"tailwindcss",
		"dockerls",
		"tsserver",
	}
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- cssls
	lspconfig.cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "css", "scss", "less", "html" },
		settings = {
			html = {
				validate = false,
			},
			css = {
				validate = true,
			},
			less = {
				validate = true,
			},
			scss = {
				validate = true,
			},
		},
	})

	-- angular
	local cwd = vim.fn.getcwd()
	local project_library_path = cwd .. "/node_modules"
	local cmd = {
		"ngserver",
		"--stdio",
		"--tsProbeLocations",
		"--ngProbeLocations",
		project_library_path,
	}

	lspconfig.angularls.setup({
		cmd = cmd,
		on_new_config = function(new_config)
			new_config.cmd = cmd
			local opts = { noremap = true, silent = true }
			local ng = require("ng")
			vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, opts)
			vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, opts)
			vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)
		end,
	})

	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh" },
	})

	-- solidity
	lspconfig.solidity.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "solidity" },
	})

	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	-- lspconfig.emmet_ls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	filetypes = {
	-- 		"html",
	-- 		"typescriptreact",
	-- 		"javascriptreact",
	-- 		"javascript",
	-- 		"css",
	-- 		"sass",
	-- 		"scss",
	-- 		"less",
	-- 		"svelte",
	-- 		"vue",
	-- 	},
	-- })

	for _, lang in pairs(langServersDefault) do
		lspconfig[lang].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettierd = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local alex = require("efmls-configs.linters.alex")
	local hadolint = require("efmls-configs.linters.hadolint")
	local solhint = require("efmls-configs.linters.solhint")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"json",
			"jsonc",
			"sh",
			"javascript",
			"js",
			"jsx",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"ts",
			"tsx",
			"svelte",
			"vue",
			"markdown",
			"docker",
			"solidity",
			"html",
			"scss",
			"css",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint_d, prettierd },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				html = { prettierd },
				sh = { shellcheck, shfmt },
				javascript = { eslint_d, prettierd },
				js = { eslint_d, prettierd },
				jsx = { eslint_d, prettierd },
				javascriptreact = { eslint_d, prettierd },
				ts = { eslint_d, prettierd },
				tsx = { eslint_d, prettierd },
				typescriptreact = { eslint_d, prettierd },
				svelte = { eslint_d, prettierd },
				vue = { eslint_d, prettierd },
				markdown = { alex, prettierd },
				docker = { hadolint, prettierd },
				solidity = { solhint },
				scss = { prettierd },
				css = { prettierd },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"joeveiga/ng.nvim",
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
