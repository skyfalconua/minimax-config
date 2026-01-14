-- Open Neo-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argc = vim.fn.argc()
    local arg0 = vim.fn.argv(0)
    if argc == 1 and (arg0 == "." or vim.fn.isdirectory(arg0) == 1) then
      return
    end

    vim.cmd("Neotree position=left")
    vim.cmd("wincmd l")
  end,
})

-- Enter insert mode on buffer switch (regular files only)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*" },
  callback = function()
    -- vim.notify(
    --   "--BufEnter "
    --   .. " buftype=" .. tostring(vim.bo.buftype)
    --   .. " modifiable=" .. tostring(vim.bo.modifiable)
    --   .. " readonly=" .. tostring(vim.bo.readonly)
    --   .. " buflisted=" .. tostring(vim.bo.buflisted)
    --   .. " bufhidden=" .. tostring(vim.bo.bufhidden)
    -- )
    if UserMisc.is_editable_buffer() then
      vim.cmd("startinsert")
    else
      vim.cmd("stopinsert")
    end
  end,
})
