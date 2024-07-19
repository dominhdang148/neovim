return {
  'Mofiqul/dracula.nvim',
  lazy=false,
  prority = 1000,
  config = function ()
    require('dracula').setup({})
  end
}
