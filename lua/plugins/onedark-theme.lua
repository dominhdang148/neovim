return {
	"navarasu/onedark.nvim",
	lazy = false,
	prority = 1000,
	config = function()
		require("onedark").setup({
			style = "deep", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		})
	end,
}
