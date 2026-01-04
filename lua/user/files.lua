local add, later = MiniDeps.add, MiniDeps.later

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

later(function()
  add({
    source = 'nvim-neo-tree/neo-tree.nvim',
    checkout = 'v3.x',
    depends = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    }
  })

  require("neo-tree").setup({
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false, -- hide files that are ignored by other gitignore-like files
      }
    }
  })
end)
