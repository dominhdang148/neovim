local config = function()
  local theme = require("lualine.themes.gruvbox")

  -- set bg transparency in all modes
  theme.normal.c.bg = nil
  theme.insert.c.bg = nil
  theme.visual.c.bg = nil
  theme.replace.c.bg = nil
  theme.command.c.bg = nil

  require("lualine").setup({
    options = {
      theme = theme,
      globalstatus = true,
    },
    tabline = {
      lualine_a = {"buffers"}
    },
    sections = {
      lualine_a = {},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {{ 'filename', file_status = true, path = 0 } },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
