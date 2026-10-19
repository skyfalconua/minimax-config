local add = vim.pack.add
local now, later = Config.now, Config.later

now(function()
  add({
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons", -- optional, but recommended
    -- neo-tree itself
    {
      src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
      version = 'v3.x',
    }
  })
end)

later(function()
  require("neo-tree").setup({
    popup_border_style = "",
    filesystem = {
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false, -- hide files that are ignored by other gitignore-like files
      }
    },
    source_selector = {
      statusline = true,
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "git_status" },
      },
      separator = { left = "", right = "" },
    },
  })

  require('mini.files').setup({
    mappings = {
      close       = 'q',
      go_in       = '<C-]>',
      go_in_plus  = '<Right>',
      go_out      = '<C-[>',
      go_out_plus = '<Left>',
      mark_goto   = "g",
      mark_set    = 'G',
      reset       = '<BS>',
      reveal_cwd  = 'R',
      show_help   = 'H',
      synchronize = '=',
      trim_left   = '<',
      trim_right  = '>',
    }
  })
end)
