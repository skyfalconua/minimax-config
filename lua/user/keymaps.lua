local maps = { n = {}, i = {}, t = {}, v = {} }

-- disable defaults
maps.n["<C-u>"] = "<Nop>" -- Move up by half a page
maps.n["<C-d>"] = "<Nop>" -- Move down by half a page
maps.n["<C-b>"] = "<Nop>" -- Move up by a page
maps.n["<C-f>"] = "<Nop>" -- Move down by a page
maps.n["q"]     = "<Nop>" -- Start macro recording

maps.n["<c-n>"] = { "<cmd>enew<cr>", desc = "New File" }
maps.i["<c-n>"] = maps.n["<c-n>"]

maps.n["<C-d>"] = { "yyp", desc = "Duplicate line" }
maps.i["<C-d>"] = { "<esc>yypi", desc = "Duplicate line" }

maps.n["<C-z>"] = { "u", desc = "Undo" }
maps.i["<C-z>"] = { "<esc>ui", desc = "Undo" }

maps.v["<C-c>"] = { "y", desc = "Copy selection" }
maps.n["<C-c>"] = { "yy", desc = "Copy line" }

maps.n["<C-x>"] = { "yydd", desc = "Cut line" }
maps.i["<C-x>"] = { "<esc>yyddi", desc = "Cut line" }

maps.n["<C-v>"] = { "p", desc = "Paste" }
maps.i["<C-v>"] = { "<esc>pi", desc = "Paste" }

maps.n["<C-a>"] = { "ggVG", desc = "Select all" }

maps.i["<C-a>"] = { "<esc>^i", desc = "Beginning of line" }
maps.i["<C-e>"] = { "<esc>$i<Right>", desc = "Ending of line" }

-- traditional mappings

maps.n["<C-s>"] = { '<cmd>wa!<cr>', desc = "Force write" }
maps.i["<C-s>"] = maps.n["<C-s>"]
maps.n["<C-q>"] = { '<cmd>qa!<cr>', desc = "Copy quit" }
maps.i["<C-q>"] = maps.n["<C-q>"]

-- plugins mappings
maps.n["<C-o>"] = { '<Cmd>lua UserMisc.mini_files_open()<CR>', desc = "MiniFiles at file" }
maps.i["<C-o>"] = maps.n["<C-o>"]

maps.n["<C-e>"] = { '<Cmd>Neotree reveal=true position=left<CR>', desc = "Neotree at file" }
maps.i["<C-e>"] = maps.n["<C-e>"]

maps.n["<C-p>"] = { '<Cmd>Neotree source=buffers position=left<CR>', desc = "Neotree buffers" }
maps.i["<C-p>"] = maps.n["<C-p>"]

-- apply mappings
for mode, mode_maps in pairs(maps) do
  for lhs, rhs in pairs(mode_maps) do
    local opts = {}
    local target = rhs

    if type(rhs) == "table" then
      opts.desc = rhs.desc
      target = rhs[1]
    end

    vim.keymap.set(mode, lhs, target, opts)
  end
end
