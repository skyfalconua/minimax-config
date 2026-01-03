local later = MiniDeps.later

later(function()
  require('mini.files').setup({
    mappings = {
       close       = 'q',
       go_in       = '<C-]>',
       go_in_plus  = '<Right>',
       go_out      = '<C-[>',
       go_out_plus = '<Left>',
       mark_goto   = "",
       mark_set    = '',
       reset       = '<BS>',
       reveal_cwd  = 'R',
       show_help   = 'H',
       synchronize = '=',
       trim_left   = '<',
       trim_right  = '>',
     }
  })
end)
