local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add('AlexvZyl/nordic.nvim')
  vim.cmd.colorscheme('nordic')
end)

later(function()
  add('folke/snacks.nvim')
  require('snacks.bigfile').setup()
  require('snacks.quickfile').setup()
  require('snacks.scroll').enable()
end)
