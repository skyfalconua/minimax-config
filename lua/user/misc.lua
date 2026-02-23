local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add('nickkadutskyi/jb.nvim')
  vim.cmd.colorscheme('jb')
end)
