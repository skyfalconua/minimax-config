local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add('AlexvZyl/nordic.nvim')
  vim.cmd.colorscheme('nordic')
end)
