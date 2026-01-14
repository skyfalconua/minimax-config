local add, now = MiniDeps.add, MiniDeps.now

-- Custom theme
now(function()
  add('nickkadutskyi/jb.nvim')
  vim.cmd.colorscheme('jb')
end)

-- Global utils
_G.UserMisc = _G.UserMisc or {}

--- Buffer types that are always editable
local editable_buftype = { "prompt", "terminal" }

function UserMisc.is_editable_buffer()
  local btype = vim.bo.buftype

  if vim.tbl_contains(editable_buftype, btype) then return true end

  if btype ~= "" then return false end

  -- Don't auto-insert if we're just previewing/navigating
  -- (like with telescope, fzf, or quick jumps)
  if vim.bo.modifiable and not vim.bo.readonly then
    return true
  end

  return false
end

function UserMisc.mini_files_open()
  if vim.bo.buftype ~= "" or not vim.bo.modifiable then
    return
  end
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end
